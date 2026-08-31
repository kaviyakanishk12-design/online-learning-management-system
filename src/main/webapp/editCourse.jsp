<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.lms.dao.CourseDAO" %>
<%@ page import="com.lms.model.Course" %>

<%
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String idParam = request.getParameter("id");

    Course course = null;

    if (idParam != null && !idParam.trim().isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);

            CourseDAO dao = new CourseDAO();

            course = dao.getCourseById(id);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Course - LMS Portal</title>

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
    min-height: 100vh;
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

/* Form container */

.page {
    display: flex;
    justify-content: center;
    padding: 45px 20px;
}

.form-card {
    width: 100%;
    max-width: 600px;
    background: white;
    padding: 35px;
    border-radius: 14px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.10);
}

.form-card h1 {
    color: #1e3a8a;
    margin-bottom: 8px;
}

.subtitle {
    color: #777;
    margin-bottom: 30px;
}

/* Form */

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #444;
}

.form-group input {
    width: 100%;
    padding: 13px;
    border: 1px solid #d1d5db;
    border-radius: 7px;
    font-size: 15px;
    outline: none;
}

.form-group input:focus {
    border-color: #2563eb;
}

/* Buttons */

.buttons {
    display: flex;
    gap: 12px;
    margin-top: 25px;
}

.btn {
    text-decoration: none;
    padding: 12px 20px;
    border: none;
    border-radius: 7px;
    cursor: pointer;
    font-size: 15px;
}

.update-btn {
    background: #2563eb;
    color: white;
}

.back-btn {
    background: #64748b;
    color: white;
}

.error {
    background: #fee2e2;
    color: #991b1b;
    padding: 15px;
    border-radius: 7px;
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


<!-- FORM -->

<div class="page">

<div class="form-card">

    <h1>
        <i class="fas fa-edit"></i>
        Edit Course
    </h1>

    <p class="subtitle">
        Update the course information below
    </p>


    <%

        if (course != null) {

    %>

    <form action="updateCourse" method="post">


        <div class="form-group">

            <label>
                Course ID
            </label>

            <input
                type="number"
                name="id"
                value="<%= course.getId() %>"
                readonly>

        </div>


        <div class="form-group">

            <label>
                Course Name
            </label>

            <input
                type="text"
                name="courseName"
                value="<%= course.getCourseName() %>"
                required>

        </div>


        <div class="form-group">

            <label>
                Instructor
            </label>

            <input
                type="text"
                name="instructor"
                value="<%= course.getInstructor() %>"
                required>

        </div>


        <div class="form-group">

            <label>
                Duration
            </label>

            <input
                type="text"
                name="duration"
                value="<%= course.getDuration() %>"
                required>

        </div>


        <div class="buttons">

            <button
                type="submit"
                class="btn update-btn">

                <i class="fas fa-save"></i>
                Update Course

            </button>


          <a href="${pageContext.request.contextPath}/adminCourses"
   class="btn back-btn">

                <i class="fas fa-arrow-left"></i>
                Back

            </a>

        </div>

    </form>


    <%

        } else {

    %>

        <div class="error">

            <i class="fas fa-exclamation-circle"></i>

            Course not found.

        </div>

        <br>

        <a href="adminCourses"
           class="btn back-btn">

            Back to Courses

        </a>

    <%

        }

    %>

</div>

</div>

</body>

</html>