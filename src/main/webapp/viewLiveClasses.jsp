<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.lms.model.LiveClass"%>

<%
ArrayList<LiveClass> classes =
(ArrayList<LiveClass>) request.getAttribute("classes");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Live Classes</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body {
    margin: 0;
    background: #f4f6f9;
    font-family: "Segoe UI", sans-serif;
}

/* Simple Header */
.header {
    background: #2E7D32;
    color: white;
    padding: 18px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header h2 {
    margin: 0;
}

.header a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    font-weight: bold;
}

.header a:hover {
    text-decoration: underline;
}

/* Main content */
.container {
    width: 90%;
    max-width: 1000px;
    margin: 40px auto;
}

.container h1 {
    color: #111;
    margin-bottom: 30px;
}

/* Class card */
.card {
    background: white;
    padding: 30px;
    margin-bottom: 25px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,.15);
}

.card h2 {
    margin-top: 0;
    color: #2E7D32;
}

.card p {
    font-size: 17px;
    margin: 12px 0;
}

/* Join button */
.join {
    display: inline-block;
    margin-top: 10px;
    padding: 12px 25px;
    background: #2E7D32;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

.join:hover {
    background: #1B5E20;
}

/* No classes */
.no-class {
    background: white;
    padding: 30px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 5px 15px rgba(0,0,0,.15);
}

</style>

</head>

<body>

<!-- Simple Header -->

<div class="header">

<h2>
    <i class="fas fa-graduation-cap"></i>
    LMS Portal
</h2>
<div>
    <a href="viewCourses">Courses</a>
    <a href="studentProfile">Profile</a>
    <a href="login.jsp">Logout</a>
</div>

</div>

<!-- Main Content -->

<div class="container">

<h1>
    <i class="fas fa-video"></i>
    Live Classes
</h1>


<%
if (classes != null && !classes.isEmpty()) {

    for (LiveClass live : classes) {
%>

<div class="card">

    <h2>
        <%= live.getClassTitle() %>
    </h2>

    <p>
        <b>Faculty :</b>
        <%= live.getInstructor() %>
    </p>

    <p>
        <b>Date :</b>
        <%= live.getClassDate() %>
    </p>

    <p>
        <b>Time :</b>
        <%= live.getClassTime() %>
    </p>


    <%
    if (live.getMeetLink() != null &&
        !live.getMeetLink().trim().isEmpty()) {
    %>

    <a href="<%= live.getMeetLink() %>"
       target="_blank"
       class="join">

        <i class="fas fa-video"></i>
        Join Class

    </a>

    <%
    } else {
    %>

    <p>
        <b>Meeting link not available.</b>
    </p>

    <%
    }
    %>

</div>

<%
    }

} else {
%>

<div class="no-class">

    <h2>No Live Classes Available</h2>

    <p>
        There are currently no live classes scheduled.
    </p>

</div>

<%
}
%>

</div>

</body>

</html>
