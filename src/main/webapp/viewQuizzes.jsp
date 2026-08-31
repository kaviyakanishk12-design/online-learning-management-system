<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Quiz"%>

<%
List<Quiz> quizzes =
(List<Quiz>)request.getAttribute("quizzes");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>view Quizzes</title>

<style>

table{
width:80%;
margin:auto;
border-collapse:collapse;
}

th,td{
padding:12px;
border:1px solid #ccc;
text-align:center;
}

th{
background:#4CAF50;
color:white;
}

</style>

</head>

<body>

<h2 align="center">Quiz List</h2>

<table>

<tr>

<th>ID</th>
<th>Title</th>
<th>Course ID</th>
<th>Total Questions</th>
<th>Take Quiz</th>

</tr>

<%
if(quizzes!=null){

for(Quiz q : quizzes){
%>

<tr>

    <td><%=q.getId()%></td>

    <td><%=q.getTitle()%></td>

    <td><%=q.getCourseId()%></td>

    <td><%=q.getTotalQuestions()%></td>

   

    <td>
        <a href="takeQuiz?quizId=<%=q.getId()%>">
            Take Quiz
        </a>
    </td>

</tr>

<%
}
}
%>

</table>

</body>

</html>