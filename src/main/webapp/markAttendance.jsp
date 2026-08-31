<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Mark Attendance</title>

<style>

body{
font-family:Segoe UI;
background:#f4f6f9;
}

.container{

width:450px;
margin:50px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 15px #ccc;

}

h2{

text-align:center;
color:#2E7D32;

}

input,select{

width:100%;
padding:12px;
margin:12px 0;

}

button{

width:100%;
padding:12px;
background:#2E7D32;
color:white;
border:none;
cursor:pointer;
font-size:16px;

}

button:hover{

background:#1B5E20;

}

</style>

</head>

<body>

<div class="container">

<h2>Mark Attendance</h2>

<form action="markAttendance" method="post">

<label>Student ID</label>

<input
type="number"
name="studentId"
required>

<label>Course ID</label>

<input
type="number"
name="courseId"
required>

<label>Status</label>

<select name="status">

<option value="Present">Present</option>

<option value="Absent">Absent</option>

</select>

<button type="submit">

Mark Attendance

</button>

</form>

</div>

</body>

</html>