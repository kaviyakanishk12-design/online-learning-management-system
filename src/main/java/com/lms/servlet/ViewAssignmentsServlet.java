
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
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewAssignments")
public class ViewAssignmentsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        AssignmentDAO assignmentDAO = new AssignmentDAO();

        List<Assignment> assignments =
                assignmentDAO.getAllAssignments();


        request.setAttribute(
                "assignments",
                assignments
        );

        request.getRequestDispatcher(
                "viewAssignments.jsp"
        ).forward(request, response);
    }
}
