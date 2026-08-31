
package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.AssignmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteAssignment")
public class DeleteAssignmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        if (request.getSession().getAttribute("adminName") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {

            try {

                int id = Integer.parseInt(idParam);

                AssignmentDAO dao = new AssignmentDAO();

                boolean deleted = dao.deleteAssignment(id);

                if (deleted) {
                    System.out.println("Assignment deleted successfully. ID: " + id);
                } else {
                    System.out.println("Assignment not found. ID: " + id);
                }

            } catch (NumberFormatException e) {

                e.printStackTrace();
            }
        }

        response.sendRedirect("viewAssignments");
    }
}
