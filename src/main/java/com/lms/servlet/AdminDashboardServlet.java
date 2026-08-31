package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.AssignmentDAO;
import com.lms.model.Assignment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        if (request.getSession().getAttribute("adminName") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        AssignmentDAO assignmentDAO = new AssignmentDAO();

        List<Assignment> assignments =
                assignmentDAO.getAllAssignments();

        request.setAttribute("assignments", assignments);

        request.getRequestDispatcher("adminDashboard.jsp")
               .forward(request, response);
    }
}