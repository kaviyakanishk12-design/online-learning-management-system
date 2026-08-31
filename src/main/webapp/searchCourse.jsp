<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Course" %>

<%
List<Course> courses =
(List<Course>)request.getAttribute("courses");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Search Courses</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,Arial,sans-serif;
}

body{
background:#f4f6f9;
}

.container{

width:90%;
max-width:1000px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 15px rgba(0,0,0,.15);

}

h2{

text-align:center;
color:#2E7D32;
margin-bottom:25px;

}

.search-box{

display:flex;
justify-content:center;
margin-bottom:25px;

}

.search-box input{

width:400px;
padding:12px;
font-size:16px;
border:1px solid #ccc;
border-radius:5px;

}

.search-box button{

padding:12px 20px;
margin-left:10px;
background:#2E7D32;
color:white;
border:none;
border-radius:5px;
cursor:pointer;

}

.search-box button:hover{

background:#1B5E20;

}

table{

width:100%;
border-collapse:collapse;

}

th{

background:#2E7D32;
color:white;
padding:12px;

}

td{

padding:12px;
border:1px solid #ddd;
text-align:center;

}

tr:nth-child(even){

background:#f8f8f8;

}

</style>

</head>

<body>

<div class="container">

<h2>Search Courses</h2>

<form action="searchCourse" method="get">

<div class="search-box">

<input
type="text"
name="keyword"
placeholder="Enter Course Name..."
required>

<button type="submit">

Search

</button>

</div>

</form>

<table>

<tr>

<th>ID</th>
<th>Course Name</th>
<th>Instructor</th>
<th>Duration</th>

</tr>

<%

if(courses!=null && !courses.isEmpty()){

for(Course c : courses){

%>

<tr>

<td><%=c.getId()%></td>

<td><%=c.getCourseName()%></td>
<td><%=c.getInstructor()%></td>
<td><%=c.getDuration()%></td>

</tr>

<%

}

}else if(request.getParameter("keyword")!=null){

%>

<tr>

<td colspan="4">

No Courses Found

</td>

</tr>

<%

}

%>

</table>

</div>

</body>

</html>