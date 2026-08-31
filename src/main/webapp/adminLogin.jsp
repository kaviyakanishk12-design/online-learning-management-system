<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>
body {
    min-height: 100vh;
    margin: 0;

    background-image:
        linear-gradient(rgba(0, 70, 40, 0.55), rgba(0, 70, 40, 0.55)),
        url("images/admindash.png");

    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;

    display: flex;
    justify-content: center;
    align-items: center;

    font-family: "Segoe UI", Arial, sans-serif;
}

.login-box  {
    width: 420px;
    background: rgba(255, 255, 255, 0.96);
    padding: 40px;
    border-radius: 18px;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.30);
}

h2 {
    text-align: center;
    color: #2E7D32;
    margin-bottom: 25px;
}

label {
    font-weight: bold;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    margin: 8px 0 18px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 12px;
    background: #2E7D32;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #1B5E20;
}
</style>

</head>

<body>

<div class="login-box">

    <h2>Admin Login</h2>

    <form action="adminLogin" method="post">

        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>

    </form>

</div>

</body>
</html>