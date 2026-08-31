package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.StudentDAO;
import com.lms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        StudentDAO dao = new StudentDAO();

        if (dao.emailExists(email)) {

            response.getWriter().println("<h2>Email already registered!</h2>");
            return;
        }

        Student student = new Student();
        student.setName(name);
        student.setEmail(email);
        student.setPassword(password);

        boolean status = dao.registerStudent(student);

        if (status) {

            response.sendRedirect("login.jsp?msg=registered");

        } else {

            response.getWriter().println("<h2>Registration Failed!</h2>");
        }
    }
}