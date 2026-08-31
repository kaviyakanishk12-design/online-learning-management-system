<%@ page import="com.lms.model.AdminDashboard"%>

<%
AdminDashboard dashboard =
(AdminDashboard)request.getAttribute("dashboard");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Analytics</title>

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
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
gap:25px;
}

.card{
padding:30px;
border-radius:12px;
color:white;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,.2);
}

.card h3{
margin-bottom:15px;
font-size:22px;
}

.card h1{
font-size:45px;
}

.students{
background:#2196F3;
}

.courses{
background:#4CAF50;
}

.assignments{
background:#FF9800;
}

.submissions{
background:#9C27B0;
}

.quizzes{
background:#F44336;
}

.certificates{
background:#009688;
}

</style>

</head>

<body>

<div class="container">

<h2>Admin Dashboard Analytics</h2>

<div class="cards">

<div class="card students">
<h3>Total Students</h3>
<h1><%=dashboard.getTotalStudents()%></h1>
</div>

<div class="card courses">
<h3>Total Courses</h3>
<h1><%=dashboard.getTotalCourses()%></h1>
</div>

<div class="card assignments">
<h3>Total Assignments</h3>
<h1><%=dashboard.getTotalAssignments()%></h1>
</div>

<div class="card submissions">
<h3>Total Submissions</h3>
<h1><%=dashboard.getTotalSubmissions()%></h1>
</div>

<div class="card quizzes">
<h3>Total Quizzes</h3>
<h1><%=dashboard.getTotalQuizzes()%></h1>
</div>

<div class="card certificates">
<h3>Total Certificates</h3>
<h1><%=dashboard.getTotalCertificates()%></h1>
</div>

</div>

</div>

</body>

</html>