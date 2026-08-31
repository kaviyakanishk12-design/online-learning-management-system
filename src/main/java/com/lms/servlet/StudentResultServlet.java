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
import jakarta.servlet.http.HttpSession;

@WebServlet("/studentResults")
public class StudentResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer studentId =
                (Integer) session.getAttribute("studentId");

        if(studentId == null){

            response.sendRedirect("login.jsp");
            return;

        }

        AssignmentSubmissionDAO dao =
                new AssignmentSubmissionDAO();

        List<AssignmentSubmission> results =
                dao.getStudentResults(studentId);

        request.setAttribute("results", results);

        request.getRequestDispatcher("studentResults.jsp")
               .forward(request, response);

    }

}