<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Submit Feedback</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,Arial,sans-serif;
}

body{
background:#f4f6f9;
}

.container{

width:500px;
margin:50px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 15px rgba(0,0,0,.15);

}

h2{

text-align:center;
color:#2E7D32;
margin-bottom:25px;

}

label{

font-weight:bold;
display:block;
margin-top:15px;

}

input,select,textarea{

width:100%;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:6px;
font-size:15px;

}

textarea{

height:120px;
resize:none;

}

button{

width:100%;
margin-top:20px;
padding:12px;
background:#2E7D32;
color:white;
border:none;
border-radius:6px;
font-size:16px;
cursor:pointer;

}

button:hover{

background:#1B5E20;

}

.success{

background:#d4edda;
color:#155724;
padding:10px;
border-radius:5px;
margin-bottom:15px;
text-align:center;

}

</style>

</head>

<body>

<div class="container">

<h2>Course Feedback</h2>

<%
if(request.getParameter("success")!=null){
%>

<div class="success">

Feedback Submitted Successfully

</div>

<%
}
%>

<form action="submitFeedback" method="post">

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

<label>Rating</label>

<select name="rating" required>

<option value="">Select Rating</option>

<option value="1">1 ⭐</option>

<option value="2">2 ⭐⭐</option>

<option value="3">3 ⭐⭐⭐</option>

<option value="4">4 ⭐⭐⭐⭐</option>

<option value="5">5 ⭐⭐⭐⭐⭐</option>

</select>

<label>Comments</label>

<textarea
name="comments"
placeholder="Write your feedback..."
required></textarea>

<button type="submit">

Submit Feedback

</button>

</form>

</div>

</body>

</html>