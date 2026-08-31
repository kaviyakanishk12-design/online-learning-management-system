package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.AttendanceDAO;
import com.lms.model.Attendance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewAttendance")
public class ViewAttendanceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        AttendanceDAO dao = new AttendanceDAO();

        List<Attendance> attendanceList = dao.getAttendance();

        request.setAttribute("attendanceList", attendanceList);

        request.getRequestDispatcher("viewAttendance.jsp")
               .forward(request, response);
    }
}