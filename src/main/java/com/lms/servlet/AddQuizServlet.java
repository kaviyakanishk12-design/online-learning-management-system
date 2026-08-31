package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.QuizDAO;
import com.lms.model.Quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addQuiz")
public class AddQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String title =
        request.getParameter("title");

        int courseId =
        Integer.parseInt(request.getParameter("courseId"));

        int totalQuestions =
        Integer.parseInt(request.getParameter("totalQuestions"));

        Quiz quiz = new Quiz();

        quiz.setTitle(title);
        quiz.setCourseId(courseId);
        quiz.setTotalQuestions(totalQuestions);

        QuizDAO dao = new QuizDAO();

        dao.addQuiz(quiz);

        response.sendRedirect("viewQuizzes");
    }
}