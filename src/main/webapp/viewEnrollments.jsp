<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Enrollment" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Enrollments</title>

<style>

body{
font-family:Arial;
}

table{
width:80%;
margin:auto;
border-collapse:collapse;
}

th,td{
border:1px solid black;
padding:10px;
text-align:center;
}

th{
background:#4CAF50;
color:white;
}

h2{
text-align:center;
margin-top:30px;
}

a{
text-decoration:none;
font-weight:bold;
}

</style>

</head>

<body>

<h2>All Student Enrollments</h2>

<table>

<tr>
<th>ID</th>
<th>Student Name</th>
<th>Course Name</th>
</tr>

<%
List<Enrollment> list =
(List<Enrollment>)request.getAttribute("enrollments");

if(list != null){

    for(Enrollment e : list){
%>

<tr>

<td><%= e.getId() %></td>

<td><%= e.getStudentName() %></td>

<td><%= e.getCourseName() %></td>

</tr>

<%
    }
}
%>

</table>

<br><br>

<center>

<a href="adminDashboard.jsp">Back to Dashboard</a>

</center>

</body>
</html>