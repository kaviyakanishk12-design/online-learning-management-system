package com.lms.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lms.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/submitAssignment")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 10 * 1024 * 1024,
    maxRequestSize = 15 * 1024 * 1024
)
public class SubmitAssignmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        int studentId;

        try {

            studentId = Integer.parseInt(
                    session.getAttribute("studentId").toString()
            );

        } catch (Exception e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid student session."
            );
            return;
        }

        String assignmentIdString =
                request.getParameter("assignmentId");

        if (assignmentIdString == null ||
            assignmentIdString.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Assignment ID is missing."
            );
            return;
        }

        int assignmentId;

        try {

            assignmentId = Integer.parseInt(
                    assignmentIdString.trim()
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid assignment ID."
            );
            return;
        }


        Part filePart;

        try {

            filePart = request.getPart("file");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Unable to receive uploaded file."
            );
            return;
        }

        if (filePart == null ||
            filePart.getSize() <= 0) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Please select a file."
            );
            return;
        }


        String originalFileName =
                filePart.getSubmittedFileName();

        if (originalFileName == null ||
            originalFileName.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid file name."
            );
            return;
        }

        // Remove path information from file name
        originalFileName =
                new File(originalFileName).getName();


        Connection con = null;

        try {

            con = DBConnection.getConnection();

            if (con == null) {

                throw new Exception(
                        "Database connection returned null."
                );
            }


            String assignmentSQL =
                    "SELECT id FROM assignments WHERE id=?";

            try (PreparedStatement ps =
                    con.prepareStatement(assignmentSQL)) {

                ps.setInt(1, assignmentId);

                try (ResultSet rs =
                        ps.executeQuery()) {

                    if (!rs.next()) {

                        response.sendError(
                                HttpServletResponse.SC_BAD_REQUEST,
                                "Assignment does not exist."
                        );
                        return;
                    }
                }
            }


            String uploadPath =
                    getServletContext().getRealPath("")
                    + File.separator
                    + "assignment_uploads";

            File uploadDirectory =
                    new File(uploadPath);

            if (!uploadDirectory.exists()) {

                boolean created =
                        uploadDirectory.mkdirs();

                if (!created &&
                    !uploadDirectory.exists()) {

                    throw new IOException(
                            "Unable to create upload directory."
                    );
                }
            }

            String extension = "";

            int dotIndex =
                    originalFileName.lastIndexOf(".");

            if (dotIndex > 0) {

                extension =
                        originalFileName.substring(dotIndex);
            }


            String storedFileName =
                    "student_"
                    + studentId
                    + "_assignment_"
                    + assignmentId
                    + "_"
                    + System.currentTimeMillis()
                    + extension;

            String filePath =
                    uploadPath
                    + File.separator
                    + storedFileName;

            filePart.write(filePath);


            String checkSQL =
                    "SELECT id "
                    + "FROM assignment_submissions "
                    + "WHERE assignment_id=? "
                    + "AND student_id=? "
                    + "LIMIT 1";

            boolean alreadySubmitted = false;

            try (PreparedStatement ps =
                    con.prepareStatement(checkSQL)) {

                ps.setInt(1, assignmentId);
                ps.setInt(2, studentId);

                try (ResultSet rs =
                        ps.executeQuery()) {

                    if (rs.next()) {

                        alreadySubmitted = true;
                    }
                }
            }

            if (alreadySubmitted) {

                String updateSQL =
                        "UPDATE assignment_submissions "
                        + "SET file_name=?, "
                        + "submitted_at=CURRENT_TIMESTAMP, "
                        + "marks=NULL, "
                        + "feedback=NULL "
                        + "WHERE assignment_id=? "
                        + "AND student_id=?";

                try (PreparedStatement ps =
                        con.prepareStatement(updateSQL)) {

                    ps.setString(1, storedFileName);
                    ps.setInt(2, assignmentId);
                    ps.setInt(3, studentId);

                    ps.executeUpdate();
                }

            }

            else {

                String insertSQL =
                        "INSERT INTO assignment_submissions "
                        + "(assignment_id, student_id, "
                        + "file_name, submitted_at, "
                        + "marks, feedback) "
                        + "VALUES (?, ?, ?, "
                        + "CURRENT_TIMESTAMP, NULL, NULL)";

                try (PreparedStatement ps =
                        con.prepareStatement(insertSQL)) {

                    ps.setInt(1, assignmentId);
                    ps.setInt(2, studentId);
                    ps.setString(3, storedFileName);

                    ps.executeUpdate();
                }
            }


            con.close();
            con = null;


            response.sendRedirect(
                    request.getContextPath()
                    + "/viewAssignments?success=submitted"
            );

        } catch (Exception e) {

            e.printStackTrace();

            if (con != null) {

                try {
                    con.close();
                } catch (Exception ignored) {
                }
            }

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>Assignment Submission Failed</h2>"
            );

            response.getWriter().println(
                    "<p><b>Error:</b> "
                    + e.getMessage()
                    + "</p>"
            );

            response.getWriter().println(
                    "<p>Check the Eclipse Console for the complete error.</p>"
            );
        }
    }
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath()
                + "/viewAssignments"
        );
    }
}