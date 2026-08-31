package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.AnnouncementDAO;
import com.lms.model.Announcement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewAnnouncements")
public class ViewAnnouncementsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentName") == null) {

            response.sendRedirect("login.jsp");
            return;
        }


        AnnouncementDAO dao = new AnnouncementDAO();

        List<Announcement> announcements =
                dao.getAllAnnouncements();

        request.setAttribute(
                "announcements",
                announcements
        );


        request.getRequestDispatcher(
                "viewAnnouncements.jsp"
        ).forward(request, response);
    }
}