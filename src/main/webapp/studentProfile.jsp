<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.lms.model.Student"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Student Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

<style>

body {
    background: #f5f7fa;
    font-family: Segoe UI, sans-serif;
}

.container {
    width: 90%;
    margin: 40px auto;
}

.profile-card {
    background: white;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,.15);

    display: flex;
    align-items: center;
    gap: 40px;
}

.profile-image {
    width: 180px;
    height: 180px;

    border-radius: 50%;

    border: 5px solid #2E7D32;

    object-fit: cover;
}

.profile-info {
    flex: 1;
}

.profile-info h1 {
    color: #2E7D32;
    margin-bottom: 20px;
}

.profile-info p {
    font-size: 20px;
    margin: 15px 0;
}

.edit-btn {
    display: inline-block;

    margin-top: 20px;

    padding: 12px 30px;

    background: #2E7D32;
    color: white;

    text-decoration: none;

    border-radius: 8px;

    font-size: 18px;
    font-weight: bold;
}

.edit-btn:hover {
    background: #1B5E20;
}

.stats {
    display: grid;

    grid-template-columns:
    repeat(4,1fr);

    gap: 20px;

    margin-top: 40px;
}

.stat {
    background: white;

    padding: 25px;

    border-radius: 15px;

    text-align: center;

    box-shadow:
    0 5px 15px rgba(0,0,0,.15);
}

.stat i {
    font-size: 40px;

    color: #2E7D32;

    margin-bottom: 15px;
}

.stat h2 {
    margin: 10px 0;
}

</style>

</head>

<body>

<%@ include file="includes/navbar.jsp"%>

<%@ include file="includes/sidebar.jsp"%>


<div class="content">

<div class="container">


<%
Integer studentId =
    (Integer) session.getAttribute("studentId");

String imagePath =
    "images/student_" + studentId + ".jpg";

Student student =
    (Student) request.getAttribute("student");
%>


<div class="profile-card">


<img src="<%=imagePath%>"
     class="profile-image"
     alt="Student Profile"
     onerror="this.src='images/student.jpg';">


<div class="profile-info">


<%
if (student != null) {
%>

<h1>
    <%= student.getName() %>
</h1>

<p>
    <b>Email :</b>
    <%= student.getEmail() %>
</p>

<p>
    <b>Status :</b>
    Active Student
</p>

<%
} else {
%>

<h2>Student profile not found.</h2>

<%
}
%>


<a href="editProfile.jsp"
   class="edit-btn">

    <i class="fas fa-edit"></i>

    Edit Profile

</a>


</div>

</div>


<div class="stats">


<div class="stat">

<i class="fas fa-book"></i>

<h2>12</h2>

Courses

</div>


<div class="stat">

<i class="fas fa-video"></i>

<h2>36</h2>

Videos

</div>


<div class="stat">

<i class="fas fa-file-alt"></i>

<h2>8</h2>

Assignments

</div>


<div class="stat">

<i class="fas fa-award"></i>

<h2>5</h2>

Certificates

</div>


</div>


</div>

</div>


</body>
</html>