package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.DiscussionDAO;
import com.lms.model.Discussion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/askQuestion")
public class AskQuestionServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException{

        HttpSession session = request.getSession();

        int studentId = (Integer)session.getAttribute("studentId");

        Discussion d = new Discussion();

        d.setStudentId(studentId);

        d.setCourseId(
                Integer.parseInt(request.getParameter("courseId")));

        d.setQuestion(request.getParameter("question"));

        DiscussionDAO dao = new DiscussionDAO();

        if(dao.addQuestion(d)){

            response.sendRedirect("askQuestion.jsp?msg=success");

        }else{

            response.getWriter().println("Failed");

        }

    }

}