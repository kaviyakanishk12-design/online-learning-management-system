package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.StudentProfileDAO;
import com.lms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/studentProfile")
public class StudentProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int studentId = (Integer) session.getAttribute("studentId");

        StudentProfileDAO dao = new StudentProfileDAO();

        Student student = dao.getStudent(studentId);

        if (student == null) {
            response.getWriter().println("<h2>Student profile not found.</h2>");
            return;
        }

        request.setAttribute("student", student);

        request.getRequestDispatcher("studentProfile.jsp")
               .forward(request, response);
    }
}