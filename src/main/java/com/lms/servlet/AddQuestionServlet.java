package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.QuestionDAO;
import com.lms.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Question q = new Question();

        q.setQuizId(Integer.parseInt(request.getParameter("quizId")));
        q.setQuestion(request.getParameter("question"));
        q.setOption1(request.getParameter("option1"));
        q.setOption2(request.getParameter("option2"));
        q.setOption3(request.getParameter("option3"));
        q.setOption4(request.getParameter("option4"));
        q.setCorrectAnswer(request.getParameter("correctAnswer"));

        QuestionDAO dao = new QuestionDAO();

        dao.addQuestion(q);

        response.sendRedirect("addQuestionPage");
    }
}