package com.lms.servlet;

import java.io.File;
import java.io.IOException;

import com.lms.dao.CourseMaterialDAO;
import com.lms.model.CourseMaterial;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/uploadMaterial")
@MultipartConfig
public class UploadMaterialServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int courseId = Integer.parseInt(request.getParameter("courseId"));

        String title = request.getParameter("title");

        String videoLink = request.getParameter("videoLink");

        Part part = request.getPart("file");

        String fileName = part.getSubmittedFileName();

        String uploadPath =
        		"C:\\Users\\Kaviya\\eclipse-workspace\\online_learning_management\\src\\main\\webapp\\uploads";
        System.out.println("Upload Path : " + uploadPath);
        part.write(uploadPath + File.separator + fileName);
        System.out.println("Saved File : " + uploadPath + File.separator + fileName);
        File folder = new File(uploadPath);

        if (!folder.exists()) {
            folder.mkdirs();
        }

        part.write(uploadPath + File.separator + fileName);

        CourseMaterial material = new CourseMaterial();

        material.setCourseId(courseId);
        material.setTitle(title);
        material.setFileName(fileName);
        material.setVideoLink(videoLink);

        CourseMaterialDAO dao = new CourseMaterialDAO();

        dao.addMaterial(material);

        response.sendRedirect("viewCourses");
    }
}