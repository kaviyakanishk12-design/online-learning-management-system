package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.EnrollmentDAO;
import com.lms.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myCourses")
public class MyCoursesServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession(false);

    if(session == null || session.getAttribute("studentId") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    int studentId =
    (Integer) session.getAttribute("studentId");

    EnrollmentDAO dao = new EnrollmentDAO();

    List<Course> courses =
    dao.getMyCourses(studentId);

    request.setAttribute("courses", courses);

    request.getRequestDispatcher("/myCourses.jsp")
           .forward(request, response);
}

}
