<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Course"%>

<%
List<Course> myCourses =
(List<Course>)request.getAttribute("courses");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Courses</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

<style>

body{
    background:#f4f6f9;
    font-family:Segoe UI,sans-serif;
}

.container{
    width:95%;
    margin:30px auto;
}

.page-title{
    font-size:40px;
    color:#2E7D32;
    margin-bottom:30px;
}

.course-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(340px,1fr));

    gap:30px;

}

.course-card{

    background:white;

    border-radius:15px;

    overflow:hidden;

    box-shadow:0 8px 20px rgba(0,0,0,.15);

    transition:.3s;

}

.course-card:hover{

    transform:translateY(-8px);

}

.course-img{

    width:100%;

    height:220px;

    object-fit:cover;

}

.course-body{

    padding:20px;

}

.course-body h2{

    color:#2E7D32;

    margin-bottom:15px;

}

.course-body p{

    margin:10px 0;

    font-size:18px;

}

.progress{

    background:#ddd;

    height:12px;

    border-radius:10px;

    overflow:hidden;

    margin:20px 0;

}

.progress-bar{

    width:70%;

    height:100%;

    background:#2E7D32;

}

.btn{

    display:block;

    text-align:center;

    background:#2E7D32;

    color:white;

    padding:14px;

    text-decoration:none;

    border-radius:8px;

    font-size:18px;

    font-weight:bold;

}

.btn:hover{

    background:#1B5E20;

}

</style>

</head>

<body>

<%@ include file="includes/navbar.jsp"%>

<%@ include file="includes/sidebar.jsp"%>

<div class="content">

<div class="container">

<h1 class="page-title">

<i class="fas fa-graduation-cap"></i>

My Courses

</h1>

<div class="course-grid">

<%
if(myCourses!=null){

for(Course c:myCourses){
%>

<div class="course-card">

<img src="images/course.jpg"
class="course-img">

<div class="course-body">

<h2><%=c.getCourseName()%></h2>

<p>

<i class="fas fa-user"></i>

<b>Instructor :</b>

<%=c.getInstructor()%>

</p>

<p>

<i class="fas fa-clock"></i>

<b>Duration :</b>

<%=c.getDuration()%>

</p>

<p>

<i class="fas fa-chart-line"></i>

<b>Progress</b>

</p>

<div class="progress">

<div class="progress-bar"></div>

</div>

<a href="viewVideos?courseId=<%=c.getId()%>"

class="btn">

Continue Learning

</a>

</div>

</div>

<%
}
}
%>

</div>

</div>

</div>

</body>

</html>