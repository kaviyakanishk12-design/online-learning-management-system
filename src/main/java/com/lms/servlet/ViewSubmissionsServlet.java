package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.AssignmentSubmissionDAO;
import com.lms.model.AssignmentSubmission;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewSubmissions")
public class ViewSubmissionsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        AssignmentSubmissionDAO dao =
                new AssignmentSubmissionDAO();

        List<AssignmentSubmission> submissions =
                dao.getAllSubmissions();

        request.setAttribute("submissions", submissions);

        request.getRequestDispatcher("adminSubmissions.jsp")
               .forward(request, response);
    }
}