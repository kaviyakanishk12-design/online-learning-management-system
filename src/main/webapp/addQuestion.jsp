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
<title>Add Question</title>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}

.container{
    width:600px;
    margin:30px auto;
    background:white;
    padding:20px;
    border-radius:8px;
    box-shadow:0 0 10px gray;
}

input,select{
    width:100%;
    padding:10px;
    margin:8px 0;
}

textarea{
    width:100%;
    height:80px;
    padding:10px;
}

button{
    width:100%;
    padding:12px;
    background:#4CAF50;
    color:white;
    border:none;
}

</style>

</head>

<body>

<div class="container">

<h2>Add Quiz Question</h2>

<form action="addQuestion" method="post">

<label>Select Quiz</label>

<select name="quizId">

<%
for(Quiz q : quizzes){
%>

<option value="<%=q.getId()%>">
<%=q.getTitle()%>
</option>

<%
}
%>

</select>

<label>Question</label>

<textarea name="question" required></textarea>

<label>Option 1</label>
<input type="text" name="option1" required>

<label>Option 2</label>
<input type="text" name="option2" required>

<label>Option 3</label>
<input type="text" name="option3" required>

<label>Option 4</label>
<input type="text" name="option4" required>

<label>Correct Answer</label>

<select name="correctAnswer">

<option value="option1">Option 1</option>
<option value="option2">Option 2</option>
<option value="option3">Option 3</option>
<option value="option4">Option 4</option>

</select>

<br><br>

<button type="submit">

Save Question

</button>

</form>

</div>

</body>
</html>