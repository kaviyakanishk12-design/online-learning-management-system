<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Student" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>

<style>

table{
    width:80%;
    border-collapse:collapse;
    margin:auto;
}

th,td{
    border:1px solid black;
    padding:10px;
    text-align:center;
}

th{
    background-color:#4CAF50;
    color:white;
}

h2{
    text-align:center;
}

a{
    text-decoration:none;
}

</style>

</head>

<body>

<h2>Registered Students</h2>

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
</tr>

<%
List<Student> students =
(List<Student>)request.getAttribute("students");

if(students!=null){

    for(Student s : students){
%>

<tr>

<td><%= s.getId() %></td>

<td><%= s.getName() %></td>

<td><%= s.getEmail() %></td>

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