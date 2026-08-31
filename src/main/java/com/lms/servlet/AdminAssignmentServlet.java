
package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.lms.dao.AssignmentDAO;
import com.lms.model.Assignment;

@WebServlet("/adminAssignments")
public class AdminAssignmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check admin login
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminName") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {

            AssignmentDAO assignmentDAO = new AssignmentDAO();

            List<Assignment> assignments =
                    assignmentDAO.getAllAssignments();

            request.setAttribute(
                    "assignments",
                    assignments
            );

            request.getRequestDispatcher(
                    "adminAssignments.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load assignments."
            );

            request.getRequestDispatcher(
                    "adminAssignments.jsp"
            ).forward(request, response);
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminName") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String action = request.getParameter("action");

        try {

            AssignmentDAO assignmentDAO =
                    new AssignmentDAO();

            if ("delete".equals(action)) {

                String idValue =
                        request.getParameter("id");

                if (idValue != null &&
                    !idValue.trim().isEmpty()) {

                    int id = Integer.parseInt(idValue);

                    assignmentDAO.deleteAssignment(id);
                }
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/adminAssignments"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to process assignment."
            );
        }
    }
}