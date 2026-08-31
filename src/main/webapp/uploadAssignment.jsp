<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Course"%>

<%
List<Course> courses =
(List<Course>)request.getAttribute("courses");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Upload Assignment</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,Arial,sans-serif;
}

body{

background:#f4f7fc;

}

.container{

width:650px;
margin:40px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 20px rgba(0,0,0,.15);

}

h2{

text-align:center;
margin-bottom:30px;
color:#2E7D32;

}

label{

display:block;
margin-top:15px;
font-weight:bold;
color:#444;

}

input,
textarea,
select{

width:100%;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;

}

textarea{

height:120px;
resize:none;

}

button{

margin-top:25px;
width:100%;
padding:14px;
background:#2E7D32;
color:white;
border:none;
border-radius:8px;
font-size:17px;
cursor:pointer;

}

button:hover{

background:#1B5E20;

}

</style>

</head>

<body>

<div class="container">

<h2>Upload Assignment</h2>

<form action="uploadAssignment"
method="post"
enctype="multipart/form-data">

<label>Select Course</label>

<select name="courseId" required>

<%
if(courses!=null){

for(Course c: courses){
%>

<option value="<%=c.getId()%>">

<%=c.getCourseName()%>

</option>

<%
}
}
%>

</select>

<label>Assignment Title</label>

<input
type="text"
name="title"
required>

<label>Description</label>

<textarea
name="description"
required></textarea>

<label>Due Date</label>

<input
type="date"
name="dueDate"
required>

<label>Assignment PDF</label>

<input
type="file"
name="file"
accept=".pdf"
required>

<button type="submit">

Upload Assignment

</button>

</form>

</div>

</body>
</html>