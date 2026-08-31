package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.ForgotPasswordDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        ForgotPasswordDAO dao = new ForgotPasswordDAO();

        boolean status = dao.resetPassword(email, newPassword);

        if(status){

            response.sendRedirect("login.jsp?reset=success");

        }else{

            response.getWriter().println("Email Not Found");

        }

    }

}