package com.lms.servlet;

import java.io.File;
import java.io.IOException;

import com.lms.dao.AssignmentDAO;
import com.lms.model.Assignment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/uploadAssignment")
@MultipartConfig
public class UploadAssignmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int courseId = Integer.parseInt(request.getParameter("courseId"));

        String title = request.getParameter("title");

        String description = request.getParameter("description");

        String dueDate = request.getParameter("dueDate");

        Part filePart = request.getPart("file");

        String fileName = filePart.getSubmittedFileName();

        String uploadPath =
                getServletContext().getRealPath("") +
                File.separator +
                "uploads";

        File folder = new File(uploadPath);

        if (!folder.exists()) {
            folder.mkdir();
        }

        filePart.write(uploadPath + File.separator + fileName);

        Assignment assignment = new Assignment();

        assignment.setCourseId(courseId);
        assignment.setTitle(title);
        assignment.setDescription(description);
        assignment.setDueDate(dueDate);
        assignment.setFileName(fileName);

        AssignmentDAO dao = new AssignmentDAO();

        dao.addAssignment(assignment);

        response.sendRedirect("uploadAssignmentPage");
    }
}