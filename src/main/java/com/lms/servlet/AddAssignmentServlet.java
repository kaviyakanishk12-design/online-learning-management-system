package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.AssignmentDAO;
import com.lms.model.Assignment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addAssignment")
public class AddAssignmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int courseId =
                Integer.parseInt(request.getParameter("courseId"));

        String title =
                request.getParameter("title");

        String description =
                request.getParameter("description");

        String dueDate =
                request.getParameter("dueDate");

        int maxMarks =
                Integer.parseInt(request.getParameter("maxMarks"));

        String assignmentType =
                request.getParameter("assignmentType");

        String statusValue =
                request.getParameter("status");

        Assignment assignment = new Assignment();

        assignment.setCourseId(courseId);
        assignment.setTitle(title);
        assignment.setDescription(description);
        assignment.setDueDate(dueDate);

        assignment.setFileName("");

        assignment.setMaxMarks(maxMarks);
        assignment.setAssignmentType(assignmentType);
        assignment.setStatus(statusValue);

        AssignmentDAO dao = new AssignmentDAO();

        boolean status = dao.addAssignment(assignment);

        if(status){

            response.sendRedirect("viewAssignments");

        }else{

            response.getWriter().println("Assignment Not Added");

        }

    }
}