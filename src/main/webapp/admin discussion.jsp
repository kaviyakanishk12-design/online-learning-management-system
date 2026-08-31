
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Discussion"%>

<%
    // ================= ADMIN LOGIN CHECK =================

    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Discussion> discussions =
            (List<Discussion>) request.getAttribute("discussions");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Discussion Forum - LMS Admin</title>

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

        /* ================= HEADER ================= */

        .header {
            background: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.10);
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
            gap: 20px;
            flex-wrap: wrap;
        }

        .nav a {
            color: #444;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
        }

        .nav a:hover {
            color: #2E7D32;
        }

        /* ================= CONTAINER ================= */

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        /* ================= TITLE ================= */

        .page-title {
            background: linear-gradient(135deg, #2E7D32, #43A047);
            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }

        .page-title h1 {
            font-size: 30px;
            margin-bottom: 8px;
        }

        .page-title p {
            font-size: 16px;
            opacity: 0.95;
        }

        /* ================= DISCUSSION CARD ================= */

        .discussion-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 22px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            border-left: 5px solid #2E7D32;
        }

        .discussion-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .discussion-id {
            background: #e8f5e9;
            color: #2E7D32;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .status {
            background: #e8f5e9;
            color: #2E7D32;
            padding: 6px 13px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .question {
            font-size: 20px;
            font-weight: bold;
            color: #222;
            margin-bottom: 18px;
        }

        .question i {
            color: #2E7D32;
            margin-right: 8px;
        }

        .details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 20px;
        }

        .detail {
            background: #f8f9fa;
            padding: 12px 15px;
            border-radius: 8px;
            color: #555;
        }

        .detail i {
            color: #2E7D32;
            width: 22px;
        }

        .reply-box {
            background: #f1f8f3;
            padding: 18px;
            border-radius: 10px;
            border-left: 4px solid #43A047;
        }

        .reply-title {
            font-weight: bold;
            color: #2E7D32;
            margin-bottom: 8px;
        }

        .reply-text {
            color: #555;
            line-height: 1.6;
        }

        /* ================= EMPTY ================= */

        .empty {
            background: white;
            padding: 60px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
        }

        .empty i {
            font-size: 50px;
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

        /* ================= BACK BUTTON ================= */

        .back {
            display: inline-block;
            margin-top: 15px;
            padding: 12px 20px;
            background: #2E7D32;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .back:hover {
            background: #1B5E20;
        }

        /* ================= RESPONSIVE ================= */

        @media(max-width: 700px) {

            .header {
                flex-direction: column;
                gap: 15px;
            }

            .details {
                grid-template-columns: 1fr;
            }

            .discussion-top {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

        }

    </style>

</head>

<body>

<!-- ================= HEADER ================= -->

<div class="header">

    <div class="logo">
        <i class="fas fa-graduation-cap"></i>
        LMS Admin Portal
    </div>

    <div class="nav">

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

        <a href="adminAssignments">
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


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="page-title">

        <h1>
            <i class="fas fa-comments"></i>
            Discussion Forum
        </h1>

        <p>
            View and manage discussions created by students.
        </p>

    </div>


<%
    if (discussions != null && !discussions.isEmpty()) {

        for (Discussion d : discussions) {
%>

        <!-- ================= DISCUSSION ================= -->

        <div class="discussion-card">

            <div class="discussion-top">

                <span class="discussion-id">
                    Discussion #<%= d.getId() %>
                </span>

                <span class="status">
                    <i class="fas fa-check-circle"></i>
                    Completed
                </span>

            </div>


            <div class="question">

                <i class="fas fa-circle-question"></i>

                <%= d.getQuestion() %>

            </div>


            <div class="details">

                <div class="detail">

                    <i class="fas fa-user"></i>

                    <strong>Student ID:</strong>

                    <%= d.getStudentId() %>

                </div>


                <div class="detail">

                    <i class="fas fa-book"></i>

                    <strong>Course ID:</strong>

                    <%= d.getCourseId() %>

                </div>

            </div>


            <div class="reply-box">

                <div class="reply-title">

                    <i class="fas fa-reply"></i>

                    Reply

                </div>

                <div class="reply-text">

                    <%
                        if (d.getReply() != null &&
                            !d.getReply().trim().isEmpty()) {
                    %>

                        <%= d.getReply() %>

                    <%
                        } else {
                    %>

                        No reply has been added yet.

                    <%
                        }
                    %>

                </div>

            </div>

        </div>

<%
        }

    } else {
%>

        <div class="empty">

            <i class="fas fa-comments"></i>

            <h2>No Discussions Available</h2>

            <p>
                There are currently no discussions from students.
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
