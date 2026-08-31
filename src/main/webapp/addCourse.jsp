<%
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Course - LMS Portal</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
        }

        .navbar {
            height: 65px;
            background: #1e3a8a;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 35px;
        }

        .logo {
            font-size: 23px;
            font-weight: bold;
        }

        .welcome {
            font-size: 15px;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 45px auto;
        }

        .card {
            background: white;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        h1 {
            color: #1e3a8a;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-size: 15px;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        button,
        a {
            padding: 12px 20px;
            border: none;
            border-radius: 7px;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
        }

        button {
            background: #16a34a;
            color: white;
        }

        a {
            background: #64748b;
            color: white;
        }
    </style>
</head>

<body>

<div class="navbar">

    <div class="logo">
        LMS Portal
    </div>

    <div class="welcome">
        Welcome, <%= session.getAttribute("adminName") %>
    </div>

</div>

<div class="container">

    <div class="card">

        <h1>Add New Course</h1>

        <form action="addCourse" method="post">

            <div class="form-group">
                <label>Course Name</label>

                <input type="text"
                       name="courseName"
                       required>
            </div>

            <div class="form-group">
                <label>Instructor</label>

                <input type="text"
                       name="instructor"
                       required>
            </div>

            <div class="form-group">
                <label>Duration</label>

                <input type="text"
                       name="duration"
                       placeholder="Example: 8 Weeks"
                       required>
            </div>

            <div class="buttons">

                <button type="submit">
                    Add Course
                </button>

                <a href="adminCourses">
                    Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>