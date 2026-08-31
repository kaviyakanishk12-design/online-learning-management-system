package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.StudentDAO;
import com.lms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("studentId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (Integer) session.getAttribute("studentId");

        StudentDAO dao = new StudentDAO();

        Student student = dao.getStudent(studentId);

        request.setAttribute("student", student);

        request.getRequestDispatcher("profile.jsp")
               .forward(request, response);
    }
}