package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.VideoDAO;
import com.lms.model.Video;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/uploadVideo")
public class UploadVideoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Video video = new Video();

        video.setCourseId(
                Integer.parseInt(request.getParameter("courseId")));

        video.setTitle(request.getParameter("title"));

        String youtubeLink = request.getParameter("youtubeLink");

     if (youtubeLink.contains("watch?v=")) {

         String videoId = youtubeLink.substring(youtubeLink.indexOf("watch?v=") + 8);

         if (videoId.contains("&")) {
             videoId = videoId.substring(0, videoId.indexOf("&"));
         }

         youtubeLink = "https://www.youtube.com/embed/" + videoId;
     }

     else if (youtubeLink.contains("youtu.be/")) {

         String videoId = youtubeLink.substring(youtubeLink.lastIndexOf("/") + 1);

         if (videoId.contains("?")) {
             videoId = videoId.substring(0, videoId.indexOf("?"));
         }

         youtubeLink = "https://www.youtube.com/embed/" + videoId;
     }

     video.setYoutubeLink(youtubeLink);
        VideoDAO dao = new VideoDAO();

        if (dao.addVideo(video)) {

            response.sendRedirect("uploadVideo.jsp?msg=success");

        } else {

            response.getWriter().println("Video Upload Failed");

        }

    }

}