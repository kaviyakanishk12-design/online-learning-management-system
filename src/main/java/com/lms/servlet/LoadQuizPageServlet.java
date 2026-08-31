package com.lms.servlet;

import java.io.IOException;
import java.util.List;

import com.lms.dao.CourseDAO;
import com.lms.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addQuizPage")
public class LoadQuizPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        CourseDAO dao = new CourseDAO();

        List<Course> courses = dao.getAllCourses();

        request.setAttribute("courses", courses);

        request.getRequestDispatcher("addQuiz.jsp")
               .forward(request, response);
    }
}