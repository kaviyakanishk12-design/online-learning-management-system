package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.CourseDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminName") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("adminCourses");
            return;
        }

        int id = Integer.parseInt(idParam);

        CourseDAO dao = new CourseDAO();

        boolean status = dao.deleteCourse(id);

        if (status) {

            response.sendRedirect("adminCourses");

        } else {

            response.getWriter().println(
                "<h2>Delete Failed</h2>"
            );
        }
    }
}