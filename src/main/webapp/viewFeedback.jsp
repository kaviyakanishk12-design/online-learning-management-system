<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Feedback"%>

<%
List<Feedback> feedbackList =
(List<Feedback>)request.getAttribute("feedbackList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Feedback</title>

<style>

body{

font-family:Segoe UI;
background:#f4f6f9;

}

.container{

width:95%;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 15px #ccc;

}

h2{

text-align:center;
color:#2E7D32;

}

table{

width:100%;
border-collapse:collapse;
margin-top:20px;

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

<h2>Student Feedback</h2>

<table>

<tr>

<th>ID</th>
<th>Student ID</th>
<th>Course ID</th>
<th>Rating</th>
<th>Comments</th>
<th>Date</th>

</tr>

<%

if(feedbackList!=null && !feedbackList.isEmpty()){

for(Feedback feedback : feedbackList){

%>

<tr>

<td><%=feedback.getId()%></td>

<td><%=feedback.getStudentId()%></td>

<td><%=feedback.getCourseId()%></td>

<td><%=feedback.getRating()%> </td>

<td><%=feedback.getComments()%></td>

<td><%=feedback.getFeedbackDate()%></td>

</tr>

<%

}

}else{

%>

<tr>

<td colspan="6">

No Feedback Available

</td>

</tr>

<%

}

%>

</table>

</div>

</body>

</html>