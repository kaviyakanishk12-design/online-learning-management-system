<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Student Login</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', sans-serif;
}

/* PAGE BACKGROUND */

body {

    min-height: 100vh;

    display: flex;

    justify-content: center;

    align-items: center;

    background-image:
        linear-gradient(
            rgba(20, 80, 50, 0.55),
            rgba(20, 80, 100, 0.55)
        ),
        url("images/main.png");

    background-size: cover;

    background-position: center;

    background-repeat: no-repeat;

}


/* LOGIN BOX */

.login-box {

    width: 420px;

    background: rgba(255, 255, 255, 0.96);

    padding: 40px;

    border-radius: 18px;

    box-shadow:
        0 20px 45px rgba(0, 0, 0, 0.30);

}


/* TITLE */

.login-box h2 {

    text-align: center;

    margin-bottom: 25px;

    color: #2E7D32;

    font-size: 30px;

}

.login-box h2 i {

    margin-right: 8px;

}


/* SUCCESS MESSAGE */

.success {

    background: #d4edda;

    color: #155724;

    padding: 10px;

    border-radius: 6px;

    margin-bottom: 15px;

    text-align: center;

}


/* ERROR MESSAGE */

.error {

    background: #f8d7da;

    color: #721c24;

    padding: 10px;

    border-radius: 6px;

    margin-bottom: 15px;

    text-align: center;

}


/* INPUT */

.input-box {

    margin-bottom: 20px;

}

.input-box label {

    display: block;

    margin-bottom: 8px;

    font-weight: bold;

    color: #222;

}

.input-box input {

    width: 100%;

    padding: 13px;

    border: 1px solid #ccc;

    border-radius: 8px;

    font-size: 16px;

    outline: none;

    transition: 0.3s;

}

.input-box input:focus {

    border-color: #2E7D32;

    box-shadow: 0 0 0 3px rgba(46, 125, 50, 0.12);

}


/* LOGIN BUTTON */

button {

    width: 100%;

    padding: 14px;

    border: none;

    background: #2E7D32;

    color: white;

    font-size: 18px;

    border-radius: 8px;

    cursor: pointer;

    transition: 0.3s;

}

button:hover {

    background: #1B5E20;

    transform: translateY(-2px);

}


/* LINKS */

.links {

    margin-top: 20px;

    text-align: center;

}

.links p {

    color: #333;

}

.links a {

    text-decoration: none;

    color: #2196F3;

    font-weight: bold;

}

.links a:hover {

    text-decoration: underline;

}


/* MOBILE */

@media (max-width: 500px) {

    .login-box {

        width: 90%;

        padding: 30px;

    }

}

</style>

</head>


<body>


<div class="login-box">

    <h2>

        <i class="fas fa-user-graduate"></i>

        Student Login

    </h2>


    <%

        if ("success".equals(request.getParameter("reset"))) {

    %>

        <div class="success">

            Password Reset Successfully.<br>

            Please Login.

        </div>

    <%

        }


        String msg = request.getParameter("msg");


        if ("registered".equals(msg)) {

    %>

        <div class="success">

            Registration Successful!

        </div>

    <%

        }


        if ("invalid".equals(msg)) {

    %>

        <div class="error">

            Invalid Email or Password

        </div>

    <%

        }

    %>


    <!-- LOGIN FORM -->

    <form action="login" method="post">


        <div class="input-box">

            <label>Email</label>

            <input
                type="email"
                placeholder="Enter your Email"
                name="email"
                required>

        </div>


        <div class="input-box">

            <label>Password</label>

            <input
                type="password"
                placeholder="Enter your Password"
                name="password"
                required>

        </div>


        <button type="submit">

            <i class="fas fa-sign-in-alt"></i>

            Login

        </button>


    </form>


    <div class="links">

        <p>

            <a href="forgotPassword.jsp">

                Forgot Password?

            </a>

        </p>

        <br>

        <p>

            Don't have an account?

            <a href="register.jsp">

                Register Here

            </a>

        </p>

    </div>


</div>


</body>

</html>