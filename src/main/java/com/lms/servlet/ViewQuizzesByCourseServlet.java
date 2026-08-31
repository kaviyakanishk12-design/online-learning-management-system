package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.QuizDAO;
import com.lms.model.Quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewQuizzesByCourse")
public class ViewQuizzesByCourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int courseId = Integer.parseInt(request.getParameter("courseId"));

        QuizDAO dao = new QuizDAO();

        List<Quiz> quizzes = dao.getQuizzesByCourse(courseId);

        request.setAttribute("quizzes", quizzes);

        request.getRequestDispatcher("viewQuizzesByCourse.jsp")
               .forward(request, response);
    }
}