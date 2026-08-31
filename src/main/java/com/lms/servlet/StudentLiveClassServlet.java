package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.lms.dao.LiveClassDAO;
import com.lms.model.LiveClass;

@WebServlet("/studentLiveClasses")
public class StudentLiveClassServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentName") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        try {

            LiveClassDAO liveClassDAO = new LiveClassDAO();


            List<LiveClass> classes =
                    liveClassDAO.getAllClasses();

            request.setAttribute("classes", classes);

            request.getRequestDispatcher(
                    "studentLiveClasses.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load live classes."
            );

            request.getRequestDispatcher(
                    "studentLiveClasses.jsp"
            ).forward(request, response);
        }
    }
}