
package com.lms.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.lms.dao.DiscussionDAO;
import com.lms.model.Discussion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewDiscussions")
public class ViewDiscussionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminName") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }
        DiscussionDAO dao = new DiscussionDAO();

        ArrayList<Discussion> list =
                dao.getAllDiscussions();

        request.setAttribute("discussions", list);

        request.getRequestDispatcher(
                "viewDiscussions.jsp"
        ).forward(request, response);
    }
}
