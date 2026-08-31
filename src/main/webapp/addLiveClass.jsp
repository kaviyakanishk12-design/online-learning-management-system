
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<title>Schedule Live Class - LMS Portal</title>

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
    background: linear-gradient(135deg, #eef7f0, #f4f6f9);
}

/* Header */
.header {
    height: 72px;
    background: #ffffff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 45px;
    box-shadow: 0 3px 15px rgba(0,0,0,0.08);
}

.logo {
    color: #2E7D32;
    font-size: 24px;
    font-weight: 700;
}

.logo i {
    margin-right: 10px;
}

.admin-info {
    color: #555;
    font-weight: 600;
}

.admin-info i {
    color: #2E7D32;
    margin-right: 7px;
}

/* Main */
.container {
    width: 90%;
    max-width: 850px;
    margin: 45px auto;
}

/* Page title */
.page-title {
    text-align: center;
    margin-bottom: 30px;
}

.page-title h1 {
    color: #222;
    font-size: 32px;
    margin-bottom: 8px;
}

.page-title h1 i {
    color: #2E7D32;
    margin-right: 10px;
}

.page-title p {
    color: #777;
    font-size: 15px;
}

/* Form Card */
.form-card {
    background: #ffffff;
    padding: 38px 42px;
    border-radius: 18px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.10);
}

/* Form group */
.form-group {
    margin-bottom: 22px;
}

.form-group label {
    display: block;
    color: #333;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 8px;
}

.form-group label i {
    color: #2E7D32;
    width: 22px;
}

/* Inputs */
.form-group input {
    width: 100%;
    height: 48px;
    padding: 0 14px;
    border: 1px solid #d5d9df;
    border-radius: 8px;
    font-size: 14px;
    outline: none;
    background: #fafafa;
    transition: 0.2s;
}

.form-group input:focus {
    border-color: #2E7D32;
    background: #fff;
    box-shadow: 0 0 0 3px rgba(46,125,50,0.10);
}

/* Two-column row */
.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

/* Button area */
.button-area {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    margin-top: 30px;
}

.btn {
    border: none;
    padding: 13px 22px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.schedule-btn {
    background: #2E7D32;
    color: white;
}

.schedule-btn:hover {
    background: #1B5E20;
}

.cancel-btn {
    background: #64748b;
    color: white;
}

.cancel-btn:hover {
    background: #475569;
}

/* Bottom note */
.form-note {
    margin-top: 20px;
    padding: 13px 15px;
    background: #f0fdf4;
    border-left: 4px solid #2E7D32;
    border-radius: 6px;
    color: #555;
    font-size: 13px;
}

/* Responsive */
@media(max-width: 650px) {

    .header {
        padding: 0 20px;
    }

    .admin-info {
        display: none;
    }

    .container {
        width: 94%;
        margin: 25px auto;
    }

    .form-card {
        padding: 25px 20px;
    }

    .form-row {
        grid-template-columns: 1fr;
        gap: 0;
    }

    .page-title h1 {
        font-size: 26px;
    }

    .button-area {
        flex-direction: column;
    }

    .btn {
        justify-content: center;
        width: 100%;
    }
}
</style>

</head>

<body>

<!-- HEADER -->
<div class="header">

    <div class="logo">
        <i class="fas fa-graduation-cap"></i>
        LMS Admin Portal
    </div>

    <div class="admin-info">
        <i class="fas fa-user-shield"></i>
        Welcome, <%= session.getAttribute("adminName") %>
    </div>

</div>

<!-- MAIN -->
<div class="container">

    <div class="page-title">

        <h1>
            <i class="fas fa-video"></i>
            Schedule Live Class
        </h1>

        <p>
            Create and schedule an online live class for students
        </p>

    </div>

    <div class="form-card">

        <form action="addLiveClass" method="post">

            <!-- Course ID -->
            <div class="form-group">

                <label>
                    <i class="fas fa-book"></i>
                    Course ID
                </label>

                <input type="number"
                       name="courseId"
                       placeholder="Enter course ID"
                       required>

            </div>

            <!-- Class Title -->
            <div class="form-group">

                <label>
                    <i class="fas fa-heading"></i>
                    Class Title
                </label>

                <input type="text"
                       name="classTitle"
                       placeholder="Enter class title"
                       required>

            </div>

            <!-- Instructor -->
            <div class="form-group">

                <label>
                    <i class="fas fa-user"></i>
                    Instructor
                </label>

                <input type="text"
                       name="instructor"
                       placeholder="Enter instructor name"
                       required>

            </div>

            <!-- Date and Time -->
            <div class="form-row">

                <div class="form-group">

                    <label>
                        <i class="fas fa-calendar"></i>
                        Class Date
                    </label>

                    <input type="date"
                           name="classDate"
                           required>

                </div>

                <div class="form-group">

                    <label>
                        <i class="fas fa-clock"></i>
                        Class Time
                    </label>

                    <input type="time"
                           name="classTime"
                           required>

                </div>

            </div>

            <!-- Meet Link -->
            <div class="form-group">

                <label>
                    <i class="fas fa-link"></i>
                    Google Meet Link
                </label>

                <input type="url"
                       name="meetLink"
                       placeholder="https://meet.google.com/..."
                       required>

            </div>

            <!-- Buttons -->
            <div class="button-area">

                <a href="viewLiveClasses" class="btn cancel-btn">
                    <i class="fas fa-arrow-left"></i>
                    Cancel
                </a>

                <button type="submit"
                        class="btn schedule-btn">

                    <i class="fas fa-calendar-check"></i>
                    Schedule Class

                </button>

            </div>

            <div class="form-note">

                <i class="fas fa-info-circle"></i>
                Make sure the class date, time and Google Meet link are correct before scheduling.

            </div>

        </form>

    </div>

</div>

</body>
</html>
