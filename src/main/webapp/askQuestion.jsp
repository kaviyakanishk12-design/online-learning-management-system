<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Ask Question</title>

<style>

body{
font-family:Segoe UI;
background:#f4f6f9;
}

.container{

width:500px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,.15);

}

h2{

text-align:center;
color:#2E7D32;

}

input,textarea{

width:100%;
padding:12px;
margin:10px 0;

}

button{

width:100%;
padding:12px;
background:#2E7D32;
color:white;
border:none;
cursor:pointer;

}

button:hover{

background:#1B5E20;

}

.success{

color:green;
text-align:center;

}

</style>

</head>

<body>

<div class="container">

<h2>Ask a Question</h2>

<%
if("success".equals(request.getParameter("msg"))){
%>

<p class="success">
Question Submitted Successfully
</p>

<%
}
%>

<form action="askQuestion" method="post">

<label>Course ID</label>

<input
type="number"
name="courseId"
required>

<label>Your Question</label>

<textarea
name="question"
rows="5"
required>
</textarea>

<button type="submit">

Submit Question

</button>

</form>

</div>

</body>
</html>