<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.AssignmentSubmission"%>

<%
List<AssignmentSubmission> results =
(List<AssignmentSubmission>)request.getAttribute("results");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Assignment Results</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
}

.container{

width:90%;
margin:auto;
margin-top:40px;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px #ccc;

}

h2{

text-align:center;
color:#2E7D32;
margin-bottom:25px;

}

table{

width:100%;
border-collapse:collapse;

}

th{

background:#2E7D32;
color:white;
padding:15px;

}

td{

padding:12px;
text-align:center;
border:1px solid #ddd;

}

tr:nth-child(even){

background:#f9f9f9;

}

</style>

</head>

<body>

<div class="container">

<h2>My Assignment Results</h2>

<table>

<tr>

<th>Assignment</th>

<th>Submitted On</th>

<th>Marks</th>

<th>Feedback</th>

</tr>

<%

if(results!=null && !results.isEmpty()){

for(AssignmentSubmission s : results){

%>

<tr>

<td><%=s.getAssignmentTitle()%></td>

<td><%=s.getSubmittedAt()%></td>

<td><%=s.getMarks()%></td>

<td>

<%=s.getFeedback()==null ?
"Not Evaluated Yet"
:
s.getFeedback()%>

</td>

</tr>

<%

}

}else{

%>

<tr>

<td colspan="4">

No Results Available

</td>

</tr>

<%

}

%>

</table>

</div>

</body>

</html>