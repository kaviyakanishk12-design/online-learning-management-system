package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.CourseDAO;
import com.lms.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminName") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String courseName = request.getParameter("courseName");
        String instructor = request.getParameter("instructor");
        String duration = request.getParameter("duration");

        Course course = new Course();

        course.setCourseName(courseName);
        course.setInstructor(instructor);
        course.setDuration(duration);

        CourseDAO dao = new CourseDAO();

        boolean status = dao.addCourse(course);

        if (status) {
            response.sendRedirect("adminCourses");

        } else {

            response.getWriter().println(
                "<h2>Failed to Add Course!</h2>"
            );
        }
    }
}