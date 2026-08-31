<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Attendance" %>

<%
List<Attendance> attendanceList =
(List<Attendance>)request.getAttribute("attendanceList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>View Attendance</title>

<style>

body{
    font-family:Segoe UI;
    background:#f4f6f9;
}

.container{
    width:95%;
    max-width:1000px;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 15px #ccc;
}

h2{
    text-align:center;
    color:#2E7D32;
    margin-bottom:20px;
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

.present{
    color:green;
    font-weight:bold;
}

.absent{
    color:red;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<h2>Attendance Records</h2>

<table>

<tr>
    <th>ID</th>
    <th>Student ID</th>
    <th>Course ID</th>
    <th>Date</th>
    <th>Status</th>
</tr>

<%
if(attendanceList != null && !attendanceList.isEmpty()){

    for(Attendance a : attendanceList){
%>

<tr>

<td><%=a.getId()%></td>

<td><%=a.getStudentId()%></td>

<td><%=a.getCourseId()%></td>

<td><%=a.getAttendanceDate()%></td>

<td>

<%
if("Present".equalsIgnoreCase(a.getStatus())){
%>

<span class="present">Present</span>

<%
}else{
%>

<span class="absent">Absent</span>

<%
}
%>

</td>

</tr>

<%
    }

}else{
%>

<tr>

<td colspan="5">

No Attendance Records Found

</td>

</tr>

<%
}
%>

</table>

</div>

</body>
</html>