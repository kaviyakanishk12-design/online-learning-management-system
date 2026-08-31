
package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.DiscussionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/replyDiscussion")
public class ReplyDiscussionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminName") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }
        String idParam = request.getParameter("id");
        String reply = request.getParameter("reply");

        if (idParam == null ||
            reply == null ||
            reply.trim().isEmpty()) {

            response.sendRedirect("viewDiscussions");
            return;
        }

        try {

            int id = Integer.parseInt(idParam);

            DiscussionDAO dao = new DiscussionDAO();

            boolean success =
                dao.replyQuestion(id, reply.trim());
            response.sendRedirect("viewDiscussions");

        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.sendRedirect("viewDiscussions");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("viewDiscussions");
        }
    }
}
