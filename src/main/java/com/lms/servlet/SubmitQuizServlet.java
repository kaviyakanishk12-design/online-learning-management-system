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

@WebServlet("/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int quizId = Integer.parseInt(request.getParameter("quizId"));

        QuestionDAO dao = new QuestionDAO();

        List<Question> questions = dao.getQuestionsByQuiz(quizId);

        int score = 0;

        for(Question q : questions){

            String answer = request.getParameter("q" + q.getId());

            System.out.println("Student Answer : " + answer);
            System.out.println("Correct Answer : " + q.getCorrectAnswer());

            if(answer != null &&
               answer.trim().equals(q.getCorrectAnswer().trim())){
                score++;
            }
        }

        request.setAttribute("score", score);
        request.setAttribute("total", questions.size());

        request.getRequestDispatcher("result.jsp")
               .forward(request, response);
    }
}