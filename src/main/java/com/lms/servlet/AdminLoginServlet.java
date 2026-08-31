package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();

        if(dao.loginAdmin(username, password)) {

            HttpSession session = request.getSession();

            session.setAttribute("adminName", username);

            response.sendRedirect("adminDashboard.jsp");

        } else {

            response.getWriter().println("<h2>Invalid Admin Login!</h2>");
        }
    }
}