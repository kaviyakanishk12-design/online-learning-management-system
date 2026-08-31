<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Course" %>

<%
if (session.getAttribute("adminName") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
}
    List<Course> courseList =
        (List<Course>) request.getAttribute("courseList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Manage Courses - LMS Portal</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    color: #333;
}

/* Navbar */

.navbar {
    height: 65px;
    background: #1e3a8a;
    color: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 35px;
}

.logo {
    font-size: 23px;
    font-weight: bold;
}

.welcome {
    font-size: 15px;
}

/* Main */

.container {
    width: 90%;
    max-width: 1200px;
    margin: 35px auto;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.header h1 {
    font-size: 30px;
    color: #1e3a8a;
}

.header p {
    margin-top: 8px;
    color: #666;
}

/* Buttons */

.btn {
    text-decoration: none;
    padding: 11px 18px;
    border-radius: 7px;
    color: white;
    display: inline-block;
    font-size: 14px;
    border: none;
    cursor: pointer;
}

.add-btn {
    background: #16a34a;
}

.edit-btn {
    background: #2563eb;
}

.delete-btn {
    background: #dc2626;
}

.back-btn {
    background: #64748b;
}

.btn i {
    margin-right: 6px;
}

/* Course grid */

.course-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 25px;
}

/* Course card */

.course-card {
    background: white;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    transition: 0.2s;
}

.course-card:hover {
    transform: translateY(-4px);
}

.course-icon {
    width: 55px;
    height: 55px;
    background: #e0e7ff;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #1e3a8a;
    font-size: 25px;
    margin-bottom: 18px;
}

.course-card h2 {
    color: #1e3a8a;
    margin-bottom: 15px;
}

.course-info {
    margin: 10px 0;
    color: #555;
}

.course-info i {
    width: 22px;
    color: #2563eb;
}

.actions {
    margin-top: 20px;
    display: flex;
    gap: 10px;
}

.empty {
    background: white;
    padding: 40px;
    text-align: center;
    border-radius: 12px;
    color: #777;
}

.bottom {
    margin-top: 35px;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        <i class="fas fa-graduation-cap"></i>
        LMS Portal
    </div>

    <div class="welcome">
        <i class="fas fa-user"></i>
      Welcome, <%= session.getAttribute("adminName") %>
    </div>

</div>


<!-- MAIN -->

<div class="container">

    <div class="header">

        <div>
            <h1>Manage Courses</h1>

            <p>
                Create, update and remove courses from the LMS
            </p>
        </div>

        <a href="addCourse.jsp" class="btn add-btn">
            <i class="fas fa-plus"></i>
            Add New Course
        </a>

    </div>


    <%

        if (courseList != null && !courseList.isEmpty()) {

    %>

    <div class="course-container">

        <%

            for (Course c : courseList) {

        %>

        <div class="course-card">

            <div class="course-icon">
                <i class="fas fa-book"></i>
            </div>

            <h2>
                <%= c.getCourseName() %>
            </h2>

            <div class="course-info">

                <i class="fas fa-user"></i>

                <strong>Instructor:</strong>

                <%= c.getInstructor() %>

            </div>


            <div class="course-info">

                <i class="fas fa-clock"></i>

                <strong>Duration:</strong>

                <%= c.getDuration() %>

            </div>


            <div class="actions">

              <a href="${pageContext.request.contextPath}/editCourse.jsp?id=<%= c.getId() %>"
   class="btn edit-btn">

                    <i class="fas fa-edit"></i>
                    Edit

                </a>


                <a
                    href="deleteCourse?id=<%= c.getId() %>"
                    class="btn delete-btn"
                    onclick="return confirm('Are you sure you want to delete this course?');">

                    <i class="fas fa-trash"></i>
                    Delete

                </a>

            </div>

        </div>

        <%

            }

        %>

    </div>

    <%

        } else {

    %>

        <div class="empty">

            <i class="fas fa-book-open"
               style="font-size:40px;"></i>

            <h2 style="margin-top:15px;">
                No Courses Available
            </h2>

            <p style="margin-top:10px;">
                Click "Add New Course" to create your first course.
            </p>

        </div>

    <%

        }

    %>


    <div class="bottom">

        <a href="adminDashboard.jsp"
           class="btn back-btn">

            <i class="fas fa-arrow-left"></i>
            Back to Admin Dashboard

        </a>

    </div>

</div>

</body>
</html>