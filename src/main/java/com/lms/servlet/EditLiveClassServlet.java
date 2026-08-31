package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.LiveClassDAO;
import com.lms.model.LiveClass;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editLiveClass")
public class EditLiveClassServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        LiveClassDAO dao = new LiveClassDAO();

        LiveClass live = dao.getClassById(id);

        if (live != null) {

            request.setAttribute("live", live);

            request.getRequestDispatcher("/editLiveClass.jsp")
                   .forward(request, response);

        } else {

            response.sendRedirect("viewLiveClasses");
        }
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        String classTitle = request.getParameter("classTitle");
        String instructor = request.getParameter("instructor");
        String classDate = request.getParameter("classDate");
        String classTime = request.getParameter("classTime");
        String meetLink = request.getParameter("meetLink");

        LiveClass live = new LiveClass();

        live.setId(id);
        live.setCourseId(courseId);
        live.setClassTitle(classTitle);
        live.setInstructor(instructor);
        live.setClassDate(classDate);
        live.setClassTime(classTime);
        live.setMeetLink(meetLink);

        LiveClassDAO dao = new LiveClassDAO();

        boolean status = dao.updateLiveClass(live);

        if (status) {
            response.sendRedirect("viewLiveClasses");
        } else {
            response.getWriter().println("Update Failed");
        }
    }
}