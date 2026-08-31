package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.AdminDAO;
import com.lms.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addAdmin")
public class AddAdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);

        AdminDAO dao = new AdminDAO();

        boolean status = dao.addAdmin(admin);

        if(status) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.getWriter().println("<h2>Admin Creation Failed!</h2>");
        }
    }
}