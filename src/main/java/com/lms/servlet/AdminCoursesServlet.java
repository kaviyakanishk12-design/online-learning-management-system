package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.CourseDAO;
import com.lms.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminCourses")
public class AdminCoursesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminName") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }
       
        CourseDAO dao = new CourseDAO();

        List<Course> courseList = dao.getAllCourses();

        request.setAttribute("courseList", courseList);

        request.getRequestDispatcher("/adminCourses.jsp")
               .forward(request, response);
    }
}