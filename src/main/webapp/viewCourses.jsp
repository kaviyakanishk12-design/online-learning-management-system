<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.lms.dao.CourseDAO" %>
<%@ page import="com.lms.model.Course" %>

<%
    if (session.getAttribute("student") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CourseDAO dao = new CourseDAO();
    List<Course> courseList = dao.getAllCourses();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Available Courses</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <%@ include file="includes/navbar.jsp" %>

    <%@ include file="includes/sidebar.jsp" %>


    <div class="content">

        <h1>Available Courses</h1>

        <div class="course-container">

            <%
                for (Course c : courseList) {
            %>

                <div class="course-card">

                    <img src="${pageContext.request.contextPath}/images/course.jpg"
                         class="course-img"
                         alt="Course Image">

                    <div class="course-body">

                        <h2>
                            <%= c.getCourseName() %>
                        </h2>

                        <p>
                            <i class="fas fa-user"></i>
                            <b>Instructor:</b>
                            <%= c.getInstructor() %>
                        </p>

                        <p>
                            <i class="fas fa-clock"></i>
                            <b>Duration:</b>
                            <%= c.getDuration() %>
                        </p>

                        <div class="buttons">

                            <a href="enroll?courseId=<%= c.getId() %>"
                               class="btn">
                                <i class="fas fa-user-plus"></i>
                                Enroll
                            </a>

                            <a href="viewVideos?courseId=<%= c.getId() %>"
                               class="btn">
                                <i class="fas fa-video"></i>
                                Videos
                            </a>

                        </div>

                    </div>

                </div>

            <%
                }
            %>

        </div>

    </div>

</body>

</html>