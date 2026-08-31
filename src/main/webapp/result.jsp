<%
int score = (Integer)request.getAttribute("score");
int total = (Integer)request.getAttribute("total");

double percentage = (score * 100.0) / total;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Quiz Result</title>

<style>

body{

font-family:Arial;
background:#f5f5f5;
text-align:center;

}

.box{

width:500px;
margin:100px auto;
background:white;
padding:40px;
border-radius:10px;

}

h1{

color:#4CAF50;

}

</style>

</head>

<body>

<div class="box">

<h1>Quiz Completed</h1>

<h2>

Score :
<%=score%> /
<%=total%>

</h2>

<h2>

Percentage :

<%=String.format("%.2f",percentage)%> %

</h2>

<%

if(percentage>=50){

%>

<h2 style="color:green">

PASS

</h2>

<%

}else{

%>

<h2 style="color:red">

FAIL

</h2>

<%

}

%>

<br>

<a href="dashboard.jsp">

Back to Dashboard

</a>

</div>

</body>

</html>