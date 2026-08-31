package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.CourseMaterialDAO;
import com.lms.model.CourseMaterial;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewMaterials")
public class ViewMaterialsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int courseId =
        Integer.parseInt(request.getParameter("courseId"));

        CourseMaterialDAO dao = new CourseMaterialDAO();
        List<CourseMaterial> materials = dao.getMaterialsByCourse(courseId);

        System.out.println("Course ID = " + courseId);
        System.out.println("Materials Found = " + materials.size());

        request.setAttribute("materials", materials);

        request.getRequestDispatcher("viewMaterials.jsp")
               .forward(request, response);
    }
    
}