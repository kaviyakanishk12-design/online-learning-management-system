
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lms.model.LiveClass" %>

<%
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    ArrayList<LiveClass> classes =
        (ArrayList<LiveClass>) request.getAttribute("classes");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Admin Live Classes - LMS Portal</title>

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
    background: #f4f6f9;
    min-height: 100vh;
}

/* HEADER */

.header {
    height: 75px;
    background: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 40px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.08);
}

.logo {
    color: #2E7D32;
    font-size: 24px;
    font-weight: bold;
}

.logo i {
    margin-right: 10px;
}

.admin-nav {
    display: flex;
    align-items: center;
    gap: 22px;
}

.admin-nav a {
    color: #444;
    text-decoration: none;
    font-weight: 600;
    font-size: 14px;
}

.admin-nav a:hover {
    color: #2E7D32;
}

/* MAIN */

.container {
    width: 90%;
    max-width: 1200px;
    margin: 35px auto;
}

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.page-header h1 {
    color: #222;
    font-size: 30px;
    margin-bottom: 7px;
}

.page-header p {
    color: #777;
}

/* ADD BUTTON */

.add-btn {
    background: #2E7D32;
    color: white;
    text-decoration: none;
    padding: 12px 18px;
    border-radius: 7px;
    font-weight: 600;
}

.add-btn:hover {
    background: #1B5E20;
}

/* CLASS CARD */

.class-card {
    background: white;
    border-radius: 14px;
    padding: 25px;
    margin-bottom: 18px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.08);

    display: flex;
    align-items: center;
    gap: 22px;
}

.class-icon {
    width: 60px;
    height: 60px;
    background: #e8f5e9;
    color: #2E7D32;
    border-radius: 12px;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 25px;
    flex-shrink: 0;
}

.class-info {
    flex: 1;
}

.class-info h2 {
    color: #222;
    margin-bottom: 10px;
}

.class-info p {
    display: inline-block;
    margin-right: 22px;
    color: #666;
    font-size: 14px;
}

.class-info i {
    color: #2E7D32;
    margin-right: 5px;
}

/* STATUS */

.status {
    background: #e8f5e9;
    color: #2E7D32;
    padding: 7px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
}

/* ACTIONS */

.actions {
    display: flex;
    gap: 8px;
}

.action-btn {
    color: white;
    text-decoration: none;
    padding: 9px 13px;
    border-radius: 6px;
    font-size: 13px;
}

.edit {
    background: #2563eb;
}

.delete {
    background: #dc2626;
}

.action-btn:hover {
    opacity: 0.85;
}

/* EMPTY */

.empty {
    background: white;
    padding: 50px;
    text-align: center;
    border-radius: 14px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.08);
}

.empty i {
    font-size: 45px;
    color: #2E7D32;
    margin-bottom: 15px;
}

.empty h2 {
    color: #333;
    margin-bottom: 8px;
}

.empty p {
    color: #777;
}

/* BACK */

.back {
    display: inline-block;
    margin-top: 20px;
    background: #64748b;
    color: white;
    text-decoration: none;
    padding: 10px 16px;
    border-radius: 7px;
}

/* RESPONSIVE */

@media(max-width: 900px) {

    .class-card {
        flex-wrap: wrap;
    }

    .class-info {
        width: calc(100% - 85px);
    }

    .status {
        margin-left: 82px;
    }

    .actions {
        margin-left: 82px;
    }
}

</style>

</head>

<body>

<!-- ADMIN HEADER -->

<div class="header">

    <div class="logo">
        <i class="fas fa-graduation-cap"></i>
        LMS Admin Portal
    </div>

    <div class="admin-nav">

        <a href="adminDashboard.jsp">
            <i class="fas fa-home"></i>
            Dashboard
        </a>

        <a href="adminCourses">
            <i class="fas fa-book"></i>
            Courses
        </a>

        <a href="viewLiveClasses">
            <i class="fas fa-video"></i>
            Live Classes
        </a>

        <a href="adminLogout">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </a>

    </div>

</div>


<!-- MAIN -->

<div class="container">

    <div class="page-header">

        <div>

            <h1>
                <i class="fas fa-video"></i>
                Live Classes Management
            </h1>

            <p>
                Create, update and manage live classes for students
            </p>

        </div>

        <a href="addLiveClass.jsp" class="add-btn">

            <i class="fas fa-plus"></i>
            Add Live Class

        </a>

    </div>


    <%

        if (classes != null && !classes.isEmpty()) {

            for (LiveClass live : classes) {

    %>

    <div class="class-card">

        <div class="class-icon">

            <i class="fas fa-video"></i>

        </div>


        <div class="class-info">

            <h2>
                <%= live.getClassTitle() %>
            </h2>

            <p>
                <i class="fas fa-user"></i>
                <strong>Faculty:</strong>
                <%= live.getInstructor() %>
            </p>

            <p>
                <i class="fas fa-calendar"></i>
                <strong>Date:</strong>
                <%= live.getClassDate() %>
            </p>

            <p>
                <i class="fas fa-clock"></i>
                <strong>Time:</strong>
                <%= live.getClassTime() %>
            </p>

        </div>


        <div>

            <span class="status">

                <i class="fas fa-circle"></i>
                Scheduled

            </span>

        </div>


        <div class="actions">

     <a href="editLiveClass?id=<%= live.getId() %>"
               class="action-btn edit">

                <i class="fas fa-edit"></i>
                Edit

            </a>

<a href="deleteLiveClass?id=<%= live.getId() %>"
   class="action-btn delete"
   onclick="return confirm('Are you sure you want to delete this live class?');">
    Delete
</a>
            

        </div>

    </div>

    <%

            }

        } else {

    %>

    <div class="empty">

        <i class="fas fa-video-slash"></i>

        <h2>No Live Classes Available</h2>

        <p>
            There are currently no live classes scheduled.
        </p>

    </div>

    <%

        }

    %>


    <a href="adminDashboard.jsp" class="back">

        <i class="fas fa-arrow-left"></i>
        Back to Admin Dashboard

    </a>

</div>

</body>
</html>
