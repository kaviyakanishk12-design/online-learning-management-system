package com.lms.servlet;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/updateProfile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int studentId =
            (Integer) session.getAttribute("studentId");

        Part filePart =
            request.getPart("profilePicture");

        if (filePart != null && filePart.getSize() > 0) {

            String fileName =
                "student_" + studentId + ".jpg";

            String uploadPath =
                getServletContext().getRealPath("/images");

            File uploadDir =
                new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            File[] oldFiles =
                uploadDir.listFiles();

            if (oldFiles != null) {

                String prefix =
                    "student_" + studentId;

                for (File oldFile : oldFiles) {

                    if (oldFile.getName()
                            .startsWith(prefix)) {

                        oldFile.delete();
                    }
                }
            }

            filePart.write(
                new File(uploadDir, fileName)
                    .getAbsolutePath()
            );

            System.out.println(
                "Profile picture saved: "
                + fileName
            );
        }

        response.sendRedirect("studentProfile");
    }
}