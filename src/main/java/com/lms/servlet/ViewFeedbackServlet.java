package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.FeedbackDAO;
import com.lms.model.Feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewFeedback")
public class ViewFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        FeedbackDAO dao = new FeedbackDAO();

        List<Feedback> feedbackList = dao.getAllFeedback();

        request.setAttribute("feedbackList", feedbackList);

        request.getRequestDispatcher("viewFeedback.jsp")
               .forward(request, response);

    }

}