<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Announcement"%>

<%
    // ================= STUDENT LOGIN CHECK =================
    if (session.getAttribute("studentName") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String studentName = (String) session.getAttribute("studentName");

    // ================= ANNOUNCEMENTS =================
    List<Announcement> announcements =
        (List<Announcement>) request.getAttribute("announcements");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Announcements - LMS Portal</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
       
    body {
        background:#f4f6f9;
        font-family:"Segoe UI", Arial, sans-serif;
        margin:0;
    }

    .header {
        height:75px;
        background:white;
        display:flex;
        align-items:center;
        justify-content:space-between;
        padding:0 40px;
        box-shadow:0 3px 12px rgba(0,0,0,0.08);
    }

    .logo {
        color:#2E7D32;
        font-size:24px;
        font-weight:bold;
    }

    .nav a {
        color:#444;
        text-decoration:none;
        font-weight:600;
        font-size:14px;
        margin-left:20px;
    }

    .nav a:hover {
        color:#2E7D32;
    }

    .container {
        width:90%;
        max-width:1100px;
        margin:40px auto;
    }

    .announcement-card {
        background:white;
        padding:25px;
        margin-bottom:20px;
        border-radius:14px;
        box-shadow:0 5px 16px rgba(0,0,0,0.08);
        border-left:5px solid #2E7D32;
    }

    .announcement-card h3 {
        color:#222;
        margin-bottom:12px;
    }

    .announcement-message {
        color:#555;
        margin-bottom:10px;
    }

    .posted-date {
        color:#888;
        font-size:13px;
    }

    .footer {
        text-align:center;
        color:#777;
        padding:30px;
        margin-top:30px;
    }
 
    </style>
</head>

<body>

<!-- ================= STUDENT HEADER ================= -->
<div class="header">
    <div class="logo">
        <i class="fas fa-graduation-cap"></i>
        LMS Student Portal
    </div>
    <div class="nav">
        <a href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="myCourses"><i class="fas fa-book"></i> My Courses</a>
        <a href="studentLiveClasses"><i class="fas fa-video"></i> Live Classes</a>
        <a href="viewAssignments"><i class="fas fa-file-alt"></i> Assignments</a>
       
        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

<!-- ================= MAIN ================= -->
<div class="container">

    <!-- WELCOME -->
    <div class="welcome">
        <h1><i class="fas fa-user-graduate"></i> Welcome, <%= studentName %></h1>
        <p>Stay updated with the latest announcements from your LMS.</p>
    </div>

    <!-- PAGE TITLE -->
    <div class="page-title">
        <h2><i class="fas fa-bullhorn"></i> Announcements</h2>
        <p>Important updates and notifications from your faculty and LMS administration.</p>
    </div>

    <!-- ================= ANNOUNCEMENTS ================= -->
    <%
        if (announcements != null && !announcements.isEmpty()) {
            for (Announcement announcement : announcements) {
    %>
    <div class="announcement-card">
        <h3><i class="fas fa-bullhorn"></i> <%= announcement.getTitle() %></h3>
        <div class="announcement-message"><%= announcement.getMessage() %></div>
        <div class="posted-date">
            <i class="fas fa-calendar-alt"></i>
            Posted On : <%= announcement.getPostedDate() %>
        </div>
    </div>
    <%
            }
        } else {
    %>
    <!-- NO ANNOUNCEMENTS -->
    <div class="empty">
        <i class="fas fa-bell-slash"></i>
        <h2>No Announcements Available</h2>
        <p>There are currently no announcements from the administration.</p>
    </div>
    <%
        }
    %>

    <!-- BACK -->
    <a href="dashboard.jsp" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>
</div>

<!-- ================= FOOTER ================= -->
<div class="footer">
    <p><i class="fas fa-graduation-cap"></i> Online Learning Management System</p>
    <p style="margin-top: 7px;">Student Portal</p>
</div>

</body>
</html>
