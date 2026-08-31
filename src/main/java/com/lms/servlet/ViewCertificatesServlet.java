package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.CertificateDAO;
import com.lms.model.Certificate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewCertificates")
public class ViewCertificatesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        CertificateDAO dao = new CertificateDAO();

        List<Certificate> certificates =
                dao.getAllCertificates();

        request.setAttribute("certificates", certificates);

        request.getRequestDispatcher("viewCertificates.jsp")
               .forward(request, response);
    }
}