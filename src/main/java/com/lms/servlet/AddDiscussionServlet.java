
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

@WebServlet("/addDiscussion")
public class AddDiscussionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }


        int studentId =
                (Integer) session.getAttribute("studentId");

        String courseIdText =
                request.getParameter("courseId");

        String question =
                request.getParameter("question");

        if (courseIdText == null ||
            courseIdText.trim().isEmpty() ||
            question == null ||
            question.trim().isEmpty()) {

            response.sendRedirect("studentDiscussion");
            return;
        }

        int courseId;

        try {

            courseId = Integer.parseInt(courseIdText);

        } catch (NumberFormatException e) {

            response.sendRedirect("studentDiscussion");
            return;
        }

        Discussion discussion = new Discussion();

        discussion.setStudentId(studentId);
        discussion.setCourseId(courseId);
        discussion.setQuestion(question.trim());

        DiscussionDAO dao = new DiscussionDAO();

        boolean success =
                dao.addQuestion(discussion);

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/studentDiscussion"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/studentDiscussion"
            );
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(
                request.getContextPath()
                + "/studentDiscussion"
        );
    }
}
