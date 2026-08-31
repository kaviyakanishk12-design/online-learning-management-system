
package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.AnnouncementDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteAnnouncement")
public class DeleteAnnouncementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        if (request.getSession().getAttribute("adminName") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {

            try {

                int id = Integer.parseInt(idParam);

                AnnouncementDAO dao = new AnnouncementDAO();

                dao.deleteAnnouncement(id);

            } catch (NumberFormatException e) {

                e.printStackTrace();
            }
        }
        response.sendRedirect("viewAnnouncements");
    }
}
