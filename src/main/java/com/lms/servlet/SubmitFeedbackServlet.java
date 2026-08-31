package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.FeedbackDAO;
import com.lms.model.Feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submitFeedback")
public class SubmitFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");

        Feedback feedback = new Feedback();

        feedback.setStudentId(studentId);
        feedback.setCourseId(courseId);
        feedback.setRating(rating);
        feedback.setComments(comments);

        FeedbackDAO dao = new FeedbackDAO();

        boolean status = dao.addFeedback(feedback);

        if (status) {

            response.sendRedirect("submitFeedback.jsp?success=1");

        } else {

            response.getWriter().println("Feedback Submission Failed");

        }
    }
}