<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Certificate</title>

<style>
body{
    font-family:Segoe UI;
    background:#f4f6f9;
}

.container{
    width:450px;
    margin:60px auto;
    background:#fff;
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
    margin:10px 0;
}

button{
    width:100%;
    padding:12px;
    background:#2E7D32;
    color:white;
    border:none;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    background:#1B5E20;
}
</style>

</head>

<body>

<div class="container">

<h2>Generate Certificate</h2>

<form action="generateCertificate" method="post">

<label>Student ID</label>
<input type="number" name="studentId" required>

<label>Course ID</label>
<input type="number" name="courseId" required>

<button type="submit">Generate Certificate</button>

</form>

</div>

</body>
</html>