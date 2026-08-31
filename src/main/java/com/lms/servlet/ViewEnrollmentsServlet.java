package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.EnrollmentDAO;
import com.lms.model.Enrollment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewEnrollments")
public class ViewEnrollmentsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        EnrollmentDAO dao = new EnrollmentDAO();

        List<Enrollment> enrollments = dao.getAllEnrollments();

        request.setAttribute("enrollments", enrollments);

        request.getRequestDispatcher("/viewEnrollments.jsp")
               .forward(request, response);
    }
}