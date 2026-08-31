package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.EnrollmentDAO;
import com.lms.model.Enrollment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String courseIdParameter = request.getParameter("courseId");

        if (courseIdParameter == null || courseIdParameter.isEmpty()) {
            response.getWriter().println("<h2>Course ID is missing.</h2>");
            return;
        }

        int studentId = (Integer) session.getAttribute("studentId");
        int courseId = Integer.parseInt(courseIdParameter);

        System.out.println("========== ENROLL DEBUG ==========");
        System.out.println("Student ID : " + studentId);
        System.out.println("Course ID  : " + courseId);
        System.out.println("==================================");

        Enrollment enrollment = new Enrollment();
        enrollment.setStudentId(studentId);
        enrollment.setCourseId(courseId);

        EnrollmentDAO dao = new EnrollmentDAO();

        if (dao.isAlreadyEnrolled(studentId, courseId)) {
            response.getWriter().println(
                "<h2>You are already enrolled in this course!</h2>"
            );
            return;
        }

        boolean status = dao.enrollCourse(enrollment);

        System.out.println("Enrollment Status : " + status);

        if (status) {
            response.sendRedirect("myCourses");
        } else {
            response.getWriter().println(
                "<h2>Enrollment Failed!</h2>"
            );
        }
    }
}