package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.QuizDAO;
import com.lms.model.Quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewQuizzes")
public class ViewQuizzesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        QuizDAO dao = new QuizDAO();

        List<Quiz> quizzes = dao.getAllQuizzes();

        request.setAttribute("quizzes", quizzes);

        request.getRequestDispatcher("viewQuizzes.jsp")
               .forward(request, response);
    }
}