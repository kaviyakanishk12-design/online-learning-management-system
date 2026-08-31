package com.lms.servlet;

import java.io.IOException;
import java.time.LocalDate;

import com.lms.dao.AttendanceDAO;
import com.lms.model.Attendance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/markAttendance")
public class MarkAttendanceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String status = request.getParameter("status");

        Attendance attendance = new Attendance();

        attendance.setStudentId(studentId);
        attendance.setCourseId(courseId);
        attendance.setAttendanceDate(LocalDate.now().toString());
        attendance.setStatus(status);

        AttendanceDAO dao = new AttendanceDAO();

        boolean result = dao.markAttendance(attendance);

        if(result){

            response.sendRedirect("viewAttendance");

        }else{

            response.getWriter().println("Attendance Mark Failed");

        }

    }

}