package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.SearchCourseDAO;
import com.lms.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchCourse")
public class SearchCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        SearchCourseDAO dao = new SearchCourseDAO();

        List<Course> courses = dao.searchCourses(keyword);

        request.setAttribute("courses", courses);

        request.getRequestDispatcher("searchCourse.jsp")
               .forward(request, response);
    }
}