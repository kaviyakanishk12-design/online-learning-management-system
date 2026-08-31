<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Forgot Password</title>

<style>

body{

font-family:Segoe UI;
background:#f4f6f9;

}

.container{

width:420px;
margin:60px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 15px #ccc;

}

h2{

text-align:center;
color:#2E7D32;

}

input{

width:100%;
padding:12px;
margin:12px 0;
border:1px solid #ccc;
border-radius:5px;

}

button{

width:100%;
padding:12px;
background:#2E7D32;
color:white;
border:none;
cursor:pointer;
font-size:16px;

}

button:hover{

background:#1B5E20;

}

</style>

</head>

<body>

<div class="container">

<h2>Forgot Password</h2>

<form action="forgotPassword" method="post">

<input
type="email"
name="email"
placeholder="Enter Registered Email"
required>

<input
type="password"
name="newPassword"
placeholder="Enter New Password"
required>

<button type="submit">

Reset Password

</button>

</form>

</div>

</body>

</html>