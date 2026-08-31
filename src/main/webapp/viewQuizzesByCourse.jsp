<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Quiz" %>

<%
List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Quizzes</title>

<style>

body{
    font-family:Arial;
    background:#f4f4f4;
}

.container{
    width:80%;
    margin:auto;
    margin-top:40px;
}

h2{
    text-align:center;
}

table{
    width:100%;
    border-collapse:collapse;
    background:white;
}

th,td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

th{
    background:#4CAF50;
    color:white;
}

a{
    text-decoration:none;
    color:white;
    background:#2196F3;
    padding:8px 16px;
    border-radius:4px;
}

a:hover{
    background:#1976D2;
}

</style>

</head>

<body>

<div class="container">

<h2>Available Quizzes</h2>

<table>

<tr>
    <th>Quiz</th>
    <th>Total Questions</th>
    <th>Action</th>
</tr>

<%
if(quizzes!=null && !quizzes.isEmpty()){

    for(Quiz q : quizzes){
%>

<tr>

<td><%=q.getTitle()%></td>

<td><%=q.getTotalQuestions()%></td>

<td>

<a href="takeQuiz?quizId=<%=q.getId()%>">
Take Quiz
</a>

</td>

</tr>

<%
    }

}else{
%>

<tr>

<td colspan="3">

No Quiz Available

</td>

</tr>

<%
}
%>

</table>

<br>

<center>

<a href="myCourses">Back</a>

</center>

</div>

</body>
</html>