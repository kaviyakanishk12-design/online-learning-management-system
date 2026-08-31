<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Registration</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{

background:linear-gradient(135deg,#4CAF50,#2196F3);

display:flex;

justify-content:center;

align-items:center;

min-height:100vh;

}

.register-box{

width:450px;

background:white;

padding:40px;

border-radius:15px;

box-shadow:0 15px 30px rgba(0,0,0,.25);

}

.register-box h2{

text-align:center;

color:#2E7D32;

margin-bottom:25px;

}

.input-box{

margin-bottom:18px;

}

.input-box label{

display:block;

font-weight:bold;

margin-bottom:8px;

}

.input-box input{

width:100%;

padding:12px;

border:1px solid #ccc;

border-radius:8px;

font-size:16px;

}

button{

width:100%;

padding:14px;

background:#2E7D32;

color:white;

border:none;

border-radius:8px;

font-size:18px;

cursor:pointer;

transition:.3s;

}

button:hover{

background:#1B5E20;

}

.links{

margin-top:20px;

text-align:center;

}

.links a{

text-decoration:none;

color:#2196F3;

font-weight:bold;

}

</style>

</head>

<body>

<div class="register-box">

<h2>

<i class="fas fa-user-plus"></i>

Student Registration

</h2>

<form action="register" method="post">

<div class="input-box">

<label>Name</label>

<input type="text"
name="name"
required>

</div>

<div class="input-box">

<label>Email</label>

<input type="email"
name="email"
required>

</div>

<div class="input-box">

<label>Password</label>

<input type="password"
name="password"
required>

</div>

<button type="submit">

<i class="fas fa-user-check"></i>

Register

</button>

</form>

<div class="links">

Already have an account?

<a href="login.jsp">

Login Here

</a>

</div>

</div>

</body>

</html>