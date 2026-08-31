package com.lms.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.lms.dao.LiveClassDAO;
import com.lms.model.LiveClass;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewLiveClasses")
public class ViewLiveClassServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        LiveClassDAO dao = new LiveClassDAO();

        ArrayList<LiveClass> list = dao.getAllClasses();

        request.setAttribute("classes", list);

        request.getRequestDispatcher("/adminLiveClasses.jsp").forward(request, response);

    }

}