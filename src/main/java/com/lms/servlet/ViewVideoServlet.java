package com.lms.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.lms.dao.VideoDAO;
import com.lms.model.Video;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewVideos")
public class ViewVideoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String courseIdParam = request.getParameter("courseId");

        VideoDAO dao = new VideoDAO();
        ArrayList<Video> videos;

        if (courseIdParam == null || courseIdParam.trim().isEmpty()) {

            videos = dao.getAllVideos();

        } else {

            try {

                int courseId = Integer.parseInt(courseIdParam);

                videos = dao.getVideosByCourse(courseId);

            } catch (NumberFormatException e) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid course ID"
                );

                return;
            }
        }

        request.setAttribute("videos", videos);

        request.getRequestDispatcher("viewVideos.jsp")
               .forward(request, response);
    }
}