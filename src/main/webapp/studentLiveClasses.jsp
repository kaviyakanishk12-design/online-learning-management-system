<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.LiveClass"%>

<%
    // ================= STUDENT LOGIN CHECK =================

    if (session.getAttribute("studentName") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    String studentName =
            (String) session.getAttribute("studentName");

    List<LiveClass> classes =
            (List<LiveClass>) request.getAttribute("classes");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Live Classes - LMS Portal</title>

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
            min-height: 75px;
            background: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 40px;

            box-shadow:
                0 3px 12px rgba(0,0,0,0.08);
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
            align-items: center;
            gap: 22px;
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

        /* ================= PAGE HEADER ================= */

        .page-header {
            background:
                linear-gradient(
                    135deg,
                    #2E7D32,
                    #43A047
                );

            color: white;

            padding: 35px;

            border-radius: 18px;

            margin-bottom: 30px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.12);
        }

        .page-header h1 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .page-header p {
            font-size: 16px;
            opacity: 0.95;
        }

        /* ================= ERROR ================= */

        .error {
            background: #ffebee;
            color: #c62828;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        /* ================= CLASS CARD ================= */

        .class-card {
            background: white;

            padding: 25px;

            margin-bottom: 20px;

            border-radius: 15px;

            box-shadow:
                0 6px 20px rgba(0,0,0,0.08);

            display: flex;

            align-items: center;

            gap: 22px;
        }

        .class-icon {
            width: 65px;
            height: 65px;

            background: #e8f5e9;

            color: #2E7D32;

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 28px;

            flex-shrink: 0;
        }

        .class-info {
            flex: 1;
        }

        .class-info h2 {
            color: #222;
            margin-bottom: 12px;
        }

        .class-info p {
            display: inline-block;

            margin-right: 20px;

            margin-bottom: 8px;

            color: #666;

            font-size: 14px;
        }

        .class-info i {
            color: #2E7D32;
            margin-right: 5px;
        }

        /* ================= JOIN BUTTON ================= */

        .join-btn {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            padding: 12px 20px;

            background: #2E7D32;

            color: white;

            text-decoration: none;

            border-radius: 8px;

            font-weight: bold;

            white-space: nowrap;
        }

        .join-btn:hover {
            background: #1B5E20;
        }

        .join-btn i {
            margin-right: 8px;
        }

        /* ================= EMPTY ================= */

        .empty {
            background: white;

            padding: 55px;

            text-align: center;

            border-radius: 15px;

            box-shadow:
                0 6px 20px rgba(0,0,0,0.08);
        }

        .empty i {
            font-size: 50px;

            color: #2E7D32;

            margin-bottom: 18px;
        }

        .empty h2 {
            color: #333;

            margin-bottom: 10px;
        }

        .empty p {
            color: #777;
        }

        /* ================= BACK ================= */

        .back {
            display: inline-block;

            margin-top: 20px;

            background: #64748b;

            color: white;

            text-decoration: none;

            padding: 10px 18px;

            border-radius: 7px;
        }

        .back:hover {
            background: #475569;
        }

        /* ================= RESPONSIVE ================= */

        @media(max-width: 800px) {

            .header {
                flex-direction: column;
                gap: 18px;

                padding: 20px;
            }

            .nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .class-card {
                flex-direction: column;

                align-items: flex-start;
            }

            .join-btn {
                width: 100%;
            }

        }

    </style>

</head>

<body>


<!-- ================= HEADER ================= -->

<div class="header">

    <div class="logo">

        <i class="fas fa-graduation-cap"></i>

        LMS Student Portal

    </div>


    <div class="nav">

      


        <a href="studentCourses">

            <i class="fas fa-book"></i>

            Courses

        </a>


        <a href="studentLiveClasses">

            <i class="fas fa-video"></i>

            Live Classes

        </a>


       


        <a href="studentAnnouncements">

            <i class="fas fa-bullhorn"></i>

            Announcements

        </a>


        <a href="logout">

            <i class="fas fa-sign-out-alt"></i>

            Logout

        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="container">


    <!-- PAGE HEADER -->

    <div class="page-header">

        <h1>

            <i class="fas fa-video"></i>

            Live Classes

        </h1>

        <p>

            Welcome, <%= studentName %>.
            View your scheduled live classes and join them online.

        </p>

    </div>


    <!-- ERROR -->

    <% if (error != null) { %>

        <div class="error">

            <i class="fas fa-exclamation-circle"></i>

            <%= error %>

        </div>

    <% } %>


    <!-- LIVE CLASSES -->

    <%

        if (classes != null && !classes.isEmpty()) {

            for (LiveClass live : classes) {

    %>


    <div class="class-card">


        <!-- ICON -->

        <div class="class-icon">

            <i class="fas fa-video"></i>

        </div>


        <!-- CLASS INFORMATION -->

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


        <!-- JOIN CLASS -->

        <%

            if (live.getMeetLink() != null &&
                !live.getMeetLink().trim().isEmpty()) {

        %>

            <a href="<%= live.getMeetLink() %>"
               target="_blank"
               class="join-btn">

                <i class="fas fa-video"></i>

                Join Live Class

            </a>

        <%

            } else {

        %>

            <span style="
                color:#777;
                font-size:14px;
                font-weight:600;
            ">

                Meeting link not available

            </span>

        <%

            }

        %>


    </div>


    <%

            }

        } else {

    %>


    <!-- NO CLASSES -->

    <div class="empty">

        <i class="fas fa-video-slash"></i>

        <h2>

            No Live Classes Available

        </h2>

        <p>

            There are currently no live classes scheduled.

        </p>

    </div>


    <%

        }

    %>


    <!-- BACK -->

    <a href="studentDashboard.jsp"
       class="back">

        <i class="fas fa-arrow-left"></i>

        Back to Dashboard

    </a>


</div>


</body>

</html>