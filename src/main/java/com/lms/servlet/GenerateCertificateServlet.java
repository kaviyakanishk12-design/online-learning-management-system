package com.lms.servlet;

import java.io.IOException;
import java.time.LocalDate;

import com.lms.dao.CertificateDAO;
import com.lms.model.Certificate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/generateCertificate")
public class GenerateCertificateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int studentId =
                Integer.parseInt(request.getParameter("studentId"));

        int courseId =
                Integer.parseInt(request.getParameter("courseId"));

        Certificate certificate = new Certificate();

        certificate.setStudentId(studentId);
        certificate.setCourseId(courseId);
        certificate.setIssueDate(LocalDate.now().toString());
        certificate.setCertificateNo("LMS" + System.currentTimeMillis());
        certificate.setStatus("Generated");

        CertificateDAO dao = new CertificateDAO();

        boolean status = dao.generateCertificate(certificate);

        if(status){

            response.sendRedirect("viewCertificates");

        }else{

            response.getWriter().println("Certificate Generation Failed");

        }

    }

}