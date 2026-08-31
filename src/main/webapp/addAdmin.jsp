<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
if (session.getAttribute("adminName") == null) {
response.sendRedirect("adminLogin.jsp");
return;
}
%>

<!DOCTYPE html>

<html> <head>

```
<meta charset="UTF-8">
<title>Add New Admin - LMS Portal</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Arial, sans-serif;
    }

    body {
        min-height: 100vh;
        background: linear-gradient(135deg, #e8f5e9, #f4f6f9);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .page-wrapper {
        width: 100%;
        max-width: 1100px;
        display: flex;
        background: white;
        border-radius: 25px;
        overflow: hidden;
        box-shadow: 0 15px 40px rgba(0,0,0,0.15);
    }

    /* Left Section */

    .left-section {
        width: 45%;
        background: linear-gradient(135deg, #2E7D32, #43A047);
        color: white;
        padding: 60px 45px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .left-section .icon {
        width: 90px;
        height: 90px;
        border-radius: 50%;
        background: rgba(255,255,255,0.18);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 25px;
    }

    .left-section .icon i {
        font-size: 42px;
    }

    .left-section h1 {
        font-size: 38px;
        margin-bottom: 15px;
    }

    .left-section p {
        font-size: 17px;
        line-height: 1.7;
        opacity: 0.95;
    }

    .features {
        margin-top: 30px;
    }

    .features p {
        margin: 15px 0;
    }

    .features i {
        margin-right: 10px;
    }

    /* Right Section */

    .right-section {
        width: 55%;
        padding: 55px;
    }

    .right-section h2 {
        color: #2E7D32;
        font-size: 30px;
        margin-bottom: 8px;
    }

    .subtitle {
        color: #777;
        margin-bottom: 35px;
    }

    .input-group {
        margin-bottom: 25px;
    }

    .input-group label {
        display: block;
        margin-bottom: 9px;
        font-weight: 600;
        color: #333;
    }

    .input-box {
        position: relative;
    }

    .input-box i {
        position: absolute;
        left: 16px;
        top: 50%;
        transform: translateY(-50%);
        color: #2E7D32;
    }

    .input-box input {
        width: 100%;
        padding: 15px 15px 15px 48px;
        border: 1px solid #ddd;
        border-radius: 10px;
        font-size: 16px;
        outline: none;
        transition: 0.3s;
    }

    .input-box input:focus {
        border-color: #2E7D32;
        box-shadow: 0 0 0 3px rgba(46,125,50,0.12);
    }

    .create-btn {
        width: 100%;
        padding: 15px;
        border: none;
        border-radius: 10px;
        background: #2E7D32;
        color: white;
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    .create-btn:hover {
        background: #1B5E20;
        transform: translateY(-2px);
    }

    .back-btn {
        display: block;
        text-align: center;
        margin-top: 20px;
        padding: 13px;
        border-radius: 10px;
        border: 1px solid #2E7D32;
        color: #2E7D32;
        text-decoration: none;
        font-weight: 600;
        transition: 0.3s;
    }

    .back-btn:hover {
        background: #e8f5e9;
    }

    @media(max-width: 750px) {

        .page-wrapper {
            width: 92%;
            flex-direction: column;
        }

        .left-section,
        .right-section {
            width: 100%;
        }

        .left-section {
            padding: 35px;
        }

        .right-section {
            padding: 35px;
        }
    }

</style>
```

</head>

<body>

<div class="page-wrapper">

```
<!-- Left Side -->

<div class="left-section">

    <div class="icon">
        <i class="fas fa-user-shield"></i>
    </div>

    <h1>LMS Portal</h1>

    <p>
        Create a new administrator account and manage
        the Online Learning Management System securely.
    </p>

    <div class="features">

        <p>
            <i class="fas fa-check-circle"></i>
            Secure administrator access
        </p>

        <p>
            <i class="fas fa-check-circle"></i>
            Manage LMS activities
        </p>

        <p>
            <i class="fas fa-check-circle"></i>
            Monitor student learning
        </p>

    </div>

</div>


<!-- Right Side -->

<div class="right-section">

    <h2>Add New Admin</h2>

    <p class="subtitle">
        Create administrator credentials
    </p>

    <form action="addAdmin" method="post">

        <div class="input-group">

            <label>Username</label>

            <div class="input-box">

                <i class="fas fa-user"></i>

                <input
                    type="text"
                    name="username"
                    placeholder="Enter admin username"
                    required>

            </div>

        </div>


        <div class="input-group">

            <label>Password</label>

            <div class="input-box">

                <i class="fas fa-lock"></i>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter admin password"
                    required>

            </div>

        </div>


        <button type="submit" class="create-btn">

            <i class="fas fa-user-plus"></i>
            Create Admin

        </button>

    </form>


    <a href="adminDashboard.jsp" class="back-btn">

        <i class="fas fa-arrow-left"></i>
        Back to Dashboard

    </a>

</div>
```

</div>

</body>
</html>
