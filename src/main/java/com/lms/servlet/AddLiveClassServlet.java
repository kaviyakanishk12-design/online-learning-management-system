package com.lms.servlet;

import java.io.IOException;

import com.lms.dao.LiveClassDAO;
import com.lms.model.LiveClass;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addLiveClass")
public class AddLiveClassServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        LiveClass live = new LiveClass();

        live.setCourseId(Integer.parseInt(request.getParameter("courseId")));
        live.setClassTitle(request.getParameter("classTitle"));
        live.setInstructor(request.getParameter("instructor"));
        live.setClassDate(request.getParameter("classDate"));
        live.setClassTime(request.getParameter("classTime"));
        live.setMeetLink(request.getParameter("meetLink"));

        LiveClassDAO dao = new LiveClassDAO();

        if(dao.addLiveClass(live)){

            response.sendRedirect("addLiveClass.jsp?msg=success");

        }else{

            response.getWriter().println("Failed");

        }

    }

}