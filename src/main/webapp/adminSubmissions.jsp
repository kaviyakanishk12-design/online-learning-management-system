<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.AssignmentSubmission"%>

<%
List<AssignmentSubmission> submissions =
(List<AssignmentSubmission>)request.getAttribute("submissions");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Student Assignment Submissions</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI,Arial,sans-serif;
}

body{
    background:#eef2f7;
}

.container{
    width:98%;
    max-width:1400px;
    margin:40px auto;
    background:#fff;
    padding:30px;
    border-radius:12px;
    box-shadow:0 5px 20px rgba(0,0,0,.15);
}

h2{
    text-align:center;
    color:#2E7D32;
    margin-bottom:25px;
    font-size:42px;
}

.table-box{
    width:100%;
    overflow-x:auto;
}

table{
    width:100%;
    border-collapse:collapse;
    min-width:1100px;
}

th{
    background:#2E7D32;
    color:white;
    padding:16px;
    text-align:center;
    font-size:18px;
}

td{
    padding:16px;
    text-align:center;
    border:1px solid #ddd;
    font-size:17px;
    vertical-align:middle;
}

tr:nth-child(even){
    background:#f8f8f8;
}

tr:hover{
    background:#eef7ee;
}

.download{
    display:inline-block;
    background:#2196F3;
    color:white;
    padding:10px 20px;
    text-decoration:none;
    border-radius:6px;
}

.download:hover{
    background:#1565C0;
}

.evaluate{
    display:inline-block;
    background:#FF9800;
    color:white;
    padding:10px 20px;
    text-decoration:none;
    border-radius:6px;
}

.evaluate:hover{
    background:#EF6C00;
}

.feedback{
    color:green;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<h2>Student Assignment Submissions</h2>

<div class="table-box">

<table>

<tr>
    <th>Student</th>
    <th>Assignment</th>
    <th>Submitted On</th>
    <th>Download</th>
    <th>Marks</th>
    <th>Feedback</th>
    <th>Action</th>
</tr>

<%

if(submissions!=null && !submissions.isEmpty()){

for(AssignmentSubmission s : submissions){

%>

<tr>

<td><%=s.getStudentName()%></td>

<td><%=s.getAssignmentTitle()%></td>

<td><%=s.getSubmittedAt()%></td>

<td>
<a class="download"
href="submissions/<%=s.getFileName()%>"
download>
Download
</a>
</td>

<td>
    <%= s.getMarks() == null ? "Not Evaluated" : s.getMarks() %>
</td>

<td class="feedback">
<%= s.getFeedback()==null ? "Not Evaluated" : s.getFeedback() %>
</td>

<td>
<a class="evaluate"
href="evaluateSubmission.jsp?id=<%=s.getId()%>">
Evaluate
</a>
</td>

</tr>

<%

}

}else{

%>

<tr>

<td colspan="7">
No Student Submissions
</td>

</tr>

<%

}

%>

</table>

</div>

</div>

</body>
</html>