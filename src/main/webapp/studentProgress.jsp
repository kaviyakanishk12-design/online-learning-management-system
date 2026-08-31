<%@ page import="com.lms.model.StudentProgress"%>

<%
StudentProgress progress =
(StudentProgress)request.getAttribute("progress");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Progress</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI;
}

body{
background:#f4f6f9;
}

.container{

width:90%;
margin:40px auto;

}

h2{

text-align:center;
margin-bottom:30px;
color:#2E7D32;

}

.cards{

display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:20px;
margin-bottom:40px;

}

.card{

background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 15px rgba(0,0,0,.15);
text-align:center;

}

.card h3{

color:#555;

}

.card h1{

margin-top:15px;
color:#2E7D32;
font-size:40px;

}

.progressBox{

background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 15px rgba(0,0,0,.15);

}

.progressBar{

width:100%;
height:35px;
background:#ddd;
border-radius:30px;
overflow:hidden;

}

.progressFill{

height:35px;
background:#4CAF50;
color:white;
text-align:center;
line-height:35px;
font-weight:bold;

}

</style>

</head>

<body>

<div class="container">

<h2>Student Progress Dashboard</h2>

<div class="cards">

<div class="card">

<h3>Courses Enrolled</h3>

<h1><%=progress.getTotalCourses()%></h1>

</div>

<div class="card">

<h3>Assignments Submitted</h3>

<h1><%=progress.getAssignmentsSubmitted()%></h1>

</div>

<div class="card">

<h3>Quizzes Completed</h3>

<h1><%=progress.getQuizzesCompleted()%></h1>

</div>

<div class="card">

<h3>Certificates Earned</h3>

<h1><%=progress.getCertificatesEarned()%></h1>

</div>

</div>

<div class="progressBox">

<h2>Overall Progress</h2>

<div class="progressBar">

<div class="progressFill"
style="width:<%=progress.getProgressPercentage()%>%">

<%=progress.getProgressPercentage()%>%

</div>

</div>

</div>

</div>

</body>

</html>