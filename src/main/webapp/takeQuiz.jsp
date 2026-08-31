<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Question"%>

<%
List<Question> questions =
    (List<Question>) request.getAttribute("questions");

Integer quizId =
    (Integer) request.getAttribute("quizId");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Take Quiz</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

<style>

.quiz-container {
    max-width: 900px;
    margin: 30px auto;
}

.quiz-header {
    background: #2E7D32;
    color: white;
    padding: 30px;
    border-radius: 15px;
    margin-bottom: 25px;
}

.quiz-header h1 {
    margin-bottom: 10px;
}

.question-card {
    background: white;
    padding: 25px;
    margin-bottom: 20px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,.10);
}

.question-card h3 {
    color: #2E7D32;
    margin-bottom: 20px;
}

.option {
    display: block;
    padding: 12px;
    margin: 10px 0;
    background: #f4f7fb;
    border-radius: 8px;
    cursor: pointer;
}

.option:hover {
    background: #e8f5e9;
}

.option input {
    width: auto;
    margin-right: 10px;
}

.submit-btn {
    display: inline-block;
    background: #2E7D32;
    color: white;
    border: none;
    padding: 14px 30px;
    border-radius: 8px;
    font-size: 17px;
    font-weight: 600;
    cursor: pointer;
}

.submit-btn:hover {
    background: #1B5E20;
}

.empty-message {
    background: white;
    padding: 30px;
    border-radius: 15px;
    text-align: center;
}

</style>

</head>

<body>

<%@ include file="includes/navbar.jsp"%>
<%@ include file="includes/sidebar.jsp"%>

<div class="content">

<div class="quiz-container">

<div class="quiz-header">

<h1>
<i class="fas fa-question-circle"></i>
Take Quiz
</h1>

<p>Answer all the questions carefully.</p>

</div>

<%
if (questions == null || questions.isEmpty()) {
%>

<div class="empty-message">

<h2>No questions found for this quiz.</h2>

<p>Please add questions before taking the quiz.</p>

</div>

<%
} else {
%>

<form action="submitQuiz" method="post">

<input type="hidden"
       name="quizId"
       value="<%=quizId%>">

<%
int number = 1;

for (Question q : questions) {
%>

<div class="question-card">

<h3>
Question <%=number++%>
</h3>

<p>
<strong><%=q.getQuestion()%></strong>
</p>

<label class="option">
<input type="radio"
       name="question_<%=q.getId()%>"
       value="<%=q.getOption1()%>"
       required>
<%=q.getOption1()%>
</label>

<label class="option">
<input type="radio"
       name="question_<%=q.getId()%>"
       value="<%=q.getOption2()%>">
<%=q.getOption2()%>
</label>

<label class="option">
<input type="radio"
       name="question_<%=q.getId()%>"
       value="<%=q.getOption3()%>">
<%=q.getOption3()%>
</label>

<label class="option">
<input type="radio"
       name="question_<%=q.getId()%>"
       value="<%=q.getOption4()%>">
<%=q.getOption4()%>
</label>

</div>

<%
}
%>

<button type="submit" class="submit-btn">
<i class="fas fa-check"></i>
Submit Quiz
</button>

</form>

<%
}
%>

</div>

</div>

</body>
</html>