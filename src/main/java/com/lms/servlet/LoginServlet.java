package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        StudentDAO dao = new StudentDAO();

        boolean status = dao.loginStudent(email, password);

        if (status) {

            int studentId = dao.getStudentId(email, password);
            String studentName = dao.getStudentName(email, password);

            HttpSession session = request.getSession();

            session.setAttribute("student", studentName);
            session.setAttribute("studentId", studentId);
            session.setAttribute("studentName", studentName);

            // Correct student dashboard
            response.sendRedirect("dashboard.jsp");

        } else {

            response.sendRedirect("login.jsp?msg=invalid");
        }
    }
}