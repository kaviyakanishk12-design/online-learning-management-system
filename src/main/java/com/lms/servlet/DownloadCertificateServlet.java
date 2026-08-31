
package com.lms.servlet;

import java.io.IOException;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;

import com.lms.dao.CertificateDAO;
import com.lms.model.Certificate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/downloadCertificate")
public class DownloadCertificateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Missing certificate ID"
            );

            return;
        }

        int id;

        try {

            id = Integer.parseInt(idParam);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid certificate ID"
            );

            return;
        }

        CertificateDAO dao = new CertificateDAO();

        Certificate cert = dao.getCertificateById(id);

        if (cert == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Certificate not found"
            );

            return;
        }

        response.setContentType("application/pdf");

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=Certificate-"
                        + cert.getCertificateNo()
                        + ".pdf"
        );

        try {

            /*
             * A4 LANDSCAPE
             * This makes the certificate look like
             * a traditional printed certificate.
             */

            Document document =
                    new Document(
                            PageSize.A4.rotate(),
                            45,
                            45,
                            45,
                            45
                    );

            PdfWriter writer =
                    PdfWriter.getInstance(
                            document,
                            response.getOutputStream()
                    );

            document.open();

            PdfContentByte canvas =
                    writer.getDirectContent();

            float width = PageSize.A4.rotate().getWidth();
            float height = PageSize.A4.rotate().getHeight();


            /*
             * ==========================
             * OUTER BORDER
             * ==========================
             */

            canvas.setColorStroke(new BaseColor(46, 125, 50));
            canvas.setLineWidth(5);

            canvas.rectangle(
                    25,
                    25,
                    width - 50,
                    height - 50
            );

            canvas.stroke();


            /*
             * ==========================
             * INNER BORDER
             * ==========================
             */

            canvas.setColorStroke(new BaseColor(198, 160, 60));
            canvas.setLineWidth(2);

            canvas.rectangle(
                    38,
                    38,
                    width - 76,
                    height - 76
            );

            canvas.stroke();


            /*
             * ==========================
             * TOP TITLE
             * ==========================
             */

            Font organizationFont =
                    new Font(
                            Font.FontFamily.TIMES_ROMAN,
                            18,
                            Font.BOLD,
                            new BaseColor(46, 125, 50)
                    );

            Paragraph organization =
                    new Paragraph(
                            "ONLINE LEARNING MANAGEMENT SYSTEM",
                            organizationFont
                    );

            organization.setAlignment(Element.ALIGN_CENTER);

            organization.setSpacingBefore(20);

            document.add(organization);


            /*
             * ==========================
             * CERTIFICATE TITLE
             * ==========================
             */

            Font titleFont =
                    new Font(
                            Font.FontFamily.TIMES_ROMAN,
                            32,
                            Font.BOLD,
                            new BaseColor(34, 34, 34)
                    );

            Paragraph title =
                    new Paragraph(
                            "COURSE COMPLETION CERTIFICATE",
                            titleFont
                    );

            title.setAlignment(Element.ALIGN_CENTER);

            title.setSpacingBefore(12);

            document.add(title);


            /*
             * ==========================
             * DECORATIVE LINE
             * ==========================
             */

            Font lineFont =
                    new Font(
                            Font.FontFamily.TIMES_ROMAN,
                            14,
                            Font.NORMAL,
                            new BaseColor(198, 160, 60)
                    );

            Paragraph line =
                    new Paragraph(
                            "✦  ✦  ✦",
                            lineFont
                    );

            line.setAlignment(Element.ALIGN_CENTER);

            line.setSpacingBefore(8);

            document.add(line);


            /*
             * ==========================
             * PRESENTED TO
             * ==========================
             */

            Font normalFont =
                    new Font(
                            Font.FontFamily.TIMES_ROMAN,
                            16,
                            Font.NORMAL,
                            new BaseColor(70, 70, 70)
                    );

            Paragraph presented =
                    new Paragraph(
                            "\nThis certificate is proudly presented to",
                            normalFont
                    );

            presented.setAlignment(Element.ALIGN_CENTER);

            presented.setSpacingBefore(15);

            document.add(presented);


            /*
             * ==========================
             * STUDENT NAME
             * ==========================
             */

            Font studentFont =
                    new Font(
                            Font.FontFamily.TIMES_ROMAN,
                            28,
                            Font.BOLDITALIC,
                            new BaseColor(46, 125, 50)
                    );

            Paragraph student =
                    new Paragraph(
                            cert.getStudentName(),
                            studentFont
                    );

            student.setAlignment(Element.ALIGN_CENTER);

            student.setSpacingBefore(8);

            document.add(student);


            /*
             * ==========================
             * DESCRIPTION
             * ==========================
             */

            Paragraph completion =
                    new Paragraph(
                            "\nFor successfully completing the course",
                            normalFont
                    );

            completion.setAlignment(Element.ALIGN_CENTER);

            completion.setSpacingBefore(8);

            document.add(completion);


            /*
             * ==========================
             * COURSE NAME
             * ==========================
             */

            Font courseFont =
                    new Font(
                            Font.FontFamily.TIMES_ROMAN,
                            24,
                            Font.BOLD,
                            new BaseColor(34, 34, 34)
                    );

            Paragraph course =
                    new Paragraph(
                            cert.getCourseName(),
                            courseFont
                    );

            course.setAlignment(Element.ALIGN_CENTER);

            course.setSpacingBefore(8);

            document.add(course);


            /*
             * ==========================
             * COURSE COMPLETION MESSAGE
             * ==========================
             */

            Paragraph message =
                    new Paragraph(
                            "\nThis certificate recognizes the successful completion "
                            + "of the above course through the "
                            + "Online Learning Management System.",
                            normalFont
                    );

            message.setAlignment(Element.ALIGN_CENTER);

            message.setSpacingBefore(8);

            document.add(message);


            /*
             * ==========================
             * BOTTOM INFORMATION
             * ==========================
             */

            Font infoFont =
                    new Font(
                            Font.FontFamily.HELVETICA,
                            11,
                            Font.NORMAL,
                            new BaseColor(70, 70, 70)
                    );


            Paragraph issueDate =
                    new Paragraph(
                            "Issue Date: " + cert.getIssueDate(),
                            infoFont
                    );

            issueDate.setAlignment(Element.ALIGN_LEFT);

            issueDate.setIndentationLeft(55);

            issueDate.setSpacingBefore(30);

            document.add(issueDate);


            Paragraph certificateNo =
                    new Paragraph(
                            "Certificate No: "
                                    + cert.getCertificateNo(),
                            infoFont
                    );

            certificateNo.setAlignment(Element.ALIGN_LEFT);

            certificateNo.setIndentationLeft(55);

            document.add(certificateNo);


            /*
             * ==========================
             * AUTHORIZED SIGNATURE
             * ==========================
             */

            Paragraph signature =
                    new Paragraph(
                            "______________________________\n"
                            + "LMS Administrator\n"
                            + "Authorized Signature",
                            infoFont
                    );

            signature.setAlignment(Element.ALIGN_RIGHT);

            signature.setIndentationRight(55);

            signature.setSpacingBefore(-35);

            document.add(signature);


            /*
             * ==========================
             * FOOTER
             * ==========================
             */

            Font footerFont =
                    new Font(
                            Font.FontFamily.HELVETICA,
                            9,
                            Font.ITALIC,
                            new BaseColor(120, 120, 120)
                    );

            Paragraph footer =
                    new Paragraph(
                            "Online Learning Management System",
                            footerFont
                    );

            footer.setAlignment(Element.ALIGN_CENTER);

            footer.setSpacingBefore(15);

            document.add(footer);


            /*
             * ==========================
             * CLOSE PDF
             * ==========================
             */

            document.close();

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Error generating certificate PDF",
                    e
            );
        }
    }
}
