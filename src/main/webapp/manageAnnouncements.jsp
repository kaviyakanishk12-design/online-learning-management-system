<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Announcement"%>
<%@ page import="com.lms.dao.AnnouncementDAO"%>

<%
    // Admin login check
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    AnnouncementDAO dao = new AnnouncementDAO();

    List<Announcement> announcements =
            dao.getAllAnnouncements();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Announcements - LMS Admin</title>

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

.nav {
    display: flex;
    gap: 22px;
}

.nav a {
    color: #444;
    text-decoration: none;
    font-weight: 600;
}

.nav a:hover {
    color: #2E7D32;
}

/* CONTAINER */

.container {
    width: 90%;
    max-width: 1100px;
    margin: 40px auto;
}

.page-title {
    margin-bottom: 25px;
}

.page-title h1 {
    color: #222;
    font-size: 32px;
    margin-bottom: 8px;
}

.page-title p {
    color: #777;
}

/* CREATE BUTTON */

.create-btn {
    display: inline-block;
    background: #2E7D32;
    color: white;
    text-decoration: none;
    padding: 13px 22px;
    border-radius: 8px;
    font-weight: bold;
    margin-bottom: 30px;
}

.create-btn:hover {
    background: #1B5E20;
}

/* ANNOUNCEMENT CARD */

.announcement-card {
    background: white;
    padding: 28px;
    margin-bottom: 22px;
    border-radius: 15px;
    border-top: 4px solid #2E7D32;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
}

.announcement-card h2 {
    color: #222;
    margin-bottom: 12px;
}

.message {
    color: #555;
    font-size: 16px;
    line-height: 1.6;
    margin-bottom: 15px;
}

.date {
    color: #777;
    font-size: 14px;
}

.date i {
    color: #2E7D32;
    margin-right: 6px;
}

/* EMPTY */

.empty {
    background: white;
    padding: 40px;
    text-align: center;
    border-radius: 15px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
}

.empty i {
    font-size: 45px;
    color: #2E7D32;
    margin-bottom: 15px;
}

.empty h2 {
    margin-bottom: 10px;
}

.empty p {
    color: #777;
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

    <div class="nav">

        <a href="adminDashboard">
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

        <a href="viewAssignments">
            <i class="fas fa-file-alt"></i>
            Assignments
        </a>

        <a href="manageAnnouncements.jsp">
            <i class="fas fa-bullhorn"></i>
            Announcements
        </a>

        <a href="adminLogout">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </a>

    </div>

</div>


<!-- MAIN -->

<div class="container">

    <div class="page-title">

        <h1>
            <i class="fas fa-bullhorn"></i>
            Manage Announcements
        </h1>

        <p>
            Create and manage announcements for students
        </p>

    </div>


    <!-- CREATE ANNOUNCEMENT -->

    <a href="addAnnouncement.jsp" class="create-btn">

        <i class="fas fa-plus"></i>

        Create Announcement

    </a>


    <!-- ANNOUNCEMENTS -->

    <%
        if (announcements != null && !announcements.isEmpty()) {

            for (Announcement a : announcements) {
    %>

        <div class="announcement-card">

            <h2>
                <%= a.getTitle() %>
            </h2>

            <div class="message">
                <%= a.getMessage() %>
            </div>

            <div class="date">

                <i class="fas fa-calendar"></i>

                Posted On:
                <%= a.getPostedDate() %>

            </div>

        </div>

    <%
            }

        } else {
    %>

        <div class="empty">

            <i class="fas fa-bullhorn"></i>

            <h2>No Announcements</h2>

            <p>
                No announcements have been created yet.
            </p>

        </div>

    <%
        }
    %>

</div>

</body>

</html>