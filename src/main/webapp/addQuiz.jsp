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
<title>Add Quiz</title>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}

.container{
    width:450px;
    margin:50px auto;
    background:white;
    padding:20px;
    border-radius:8px;
    box-shadow:0 0 10px #ccc;
}

input,select{
    width:100%;
    padding:10px;
    margin:10px 0;
}

button{
    width:100%;
    padding:10px;
    background:#4CAF50;
    color:white;
    border:none;
    cursor:pointer;
}

</style>

</head>

<body>

<div class="container">

<h2>Add Quiz</h2>

<form action="addQuiz" method="post">

<label>Quiz Title</label>

<input type="text"
       name="title"
       required>

<label>Select Course</label>

<select name="courseId">

<%
for(Course c : courses){
%>

<option value="<%=c.getId()%>">
<%=c.getCourseName()%>
</option>

<%
}
%>

</select>

<label>Total Questions</label>

<input type="number"
       name="totalQuestions"
       required>

<button type="submit">

Create Quiz

</button>

</form>

</div>

</body>
</html>