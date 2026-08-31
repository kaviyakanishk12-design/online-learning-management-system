package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.StudentProgressDAO;
import com.lms.model.StudentProgress;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewProgress")
public class ViewProgressServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int studentId = (Integer) session.getAttribute("studentId");

        StudentProgressDAO dao = new StudentProgressDAO();

        StudentProgress progress = dao.getProgress(studentId);

        request.setAttribute("progress", progress);

        request.getRequestDispatcher("studentProgress.jsp")
               .forward(request, response);
    }
}