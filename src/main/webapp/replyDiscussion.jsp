<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Reply Discussion</title>

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

textarea{

width:100%;
padding:12px;

}

button{

width:100%;
padding:12px;
background:#2E7D32;
color:white;
border:none;
margin-top:15px;

}

</style>

</head>

<body>

<div class="container">

<h2>Reply to Student</h2>

<form action="replyDiscussion" method="post">

<input
type="hidden"
name="id"
value="<%=request.getParameter("id")%>">

<textarea
name="reply"
rows="6"
required>

</textarea>

<button>

Submit Reply

</button>

</form>

</div>

</body>

</html>