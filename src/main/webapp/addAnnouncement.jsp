<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Announcement</title>

<style>

body{
    font-family:Segoe UI;
    background:#f4f6f9;
}

.container{
    width:600px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 15px #ccc;
}

h2{
    text-align:center;
    color:#2E7D32;
}

input,textarea{
    width:100%;
    padding:12px;
    margin-top:15px;
    margin-bottom:15px;
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
    background:#1b5e20;
}

</style>

</head>

<body>

<div class="container">

<h2>Add Announcement</h2>

<form action="addAnnouncement" method="post">

<input type="text"
name="title"
placeholder="Announcement Title"
required>

<textarea
name="message"
rows="6"
placeholder="Announcement Message"
required></textarea>

<button type="submit">
Post Announcement
</button>

</form>

</div>

</body>
</html>