package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.AnnouncementDAO;
import com.lms.model.Announcement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addAnnouncement")
public class AddAnnouncementServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String message = request.getParameter("message");

        Announcement announcement = new Announcement();

        announcement.setTitle(title);
        announcement.setMessage(message);

        AnnouncementDAO dao = new AnnouncementDAO();

        boolean status = dao.addAnnouncement(announcement);

        if(status){

            response.sendRedirect("viewAnnouncements");

        }else{

            response.getWriter().println("Announcement Not Added");

        }

    }

}