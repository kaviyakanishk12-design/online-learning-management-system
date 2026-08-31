package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.QuestionDAO;
import com.lms.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/takeQuiz")
public class TakeQuizServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String quizIdParam = request.getParameter("quizId");
        if (quizIdParam == null || quizIdParam.trim().isEmpty()) {
            response.sendRedirect("viewQuizzes");
            return;
        }

        int quizId;

        try {
            quizId = Integer.parseInt(quizIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("viewQuizzes");
            return;
        }

        QuestionDAO dao = new QuestionDAO();

        List<Question> questions = dao.getQuestionsByQuiz(quizId);

        request.setAttribute("questions", questions);
        request.setAttribute("quizId", quizId);

        request.getRequestDispatcher("takeQuiz.jsp")
               .forward(request, response);
    }
}