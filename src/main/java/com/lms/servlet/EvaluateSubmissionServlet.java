package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.AssignmentSubmissionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/evaluateSubmission")
public class EvaluateSubmissionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(request.getParameter("id"));

        int marks =
                Integer.parseInt(request.getParameter("marks"));

        String feedback =
                request.getParameter("feedback");

        AssignmentSubmissionDAO dao =
                new AssignmentSubmissionDAO();

        dao.updateMarks(id, marks, feedback);

        response.sendRedirect("viewSubmissions");

    }

}