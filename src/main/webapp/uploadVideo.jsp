<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Course Video</title>

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
box-shadow:0 0 15px #ccc;
}

input{
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

</style>

</head>

<body>

<div class="container">

<h2>Upload Course Video</h2>

<%
if("success".equals(request.getParameter("msg"))){
%>

<p style="color:green;">
Video Uploaded Successfully
</p>

<%
}
%>

<form action="uploadVideo" method="post">

Course ID

<input type="number" name="courseId" required>

Video Title

<input type="text" name="title" required>

YouTube Link

<input type="text" name="youtubeLink" required>

<button type="submit">

Upload Video

</button>

</form>

</div>

</body>
</html>