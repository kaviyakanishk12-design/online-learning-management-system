package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.LiveClassDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteLiveClass")
public class DeleteLiveClassServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        LiveClassDAO dao = new LiveClassDAO();

        boolean status = dao.deleteLiveClass(id);

        if (status) {
            response.sendRedirect("viewLiveClasses");
        } else {
            response.getWriter().println("Delete Failed");
        }
    }
}