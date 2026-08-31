
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.lms.dao.DiscussionDAO" %>

<%
    // ================= ADMIN LOGIN CHECK =================

    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String adminName = (String) session.getAttribute("adminName");

    // ================= DISCUSSION COUNT =================

    int totalDiscussions = 0;

    try {
        DiscussionDAO discussionDAO = new DiscussionDAO();
        totalDiscussions = discussionDAO.getDiscussionCount();
    } catch (Exception e) {
        totalDiscussions = 0;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard - LMS Portal</title>

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
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(to bottom right, #2E7D32, #1B5E20);
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

        /* ================= MAIN ================= */

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
        }

        /* ================= WELCOME ================= */

        .welcome {
            background: linear-gradient(135deg, #2E7D32, #43A047);
            color: white;
            padding: 35px;
            border-radius: 18px;
            margin-bottom: 30px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .welcome h1 {
            font-size: 32px;
            margin-bottom: 10px;
        }

        .welcome p {
            font-size: 17px;
            opacity: 0.95;
        }

        /* ================= DASHBOARD CARDS ================= */

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 22px;
            margin-bottom: 35px;
        }

        .dashboard-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .dashboard-card:hover {
            transform: translateY(-4px);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background: #e8f5e9;
            color: #2E7D32;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 27px;
            margin-bottom: 18px;
        }

        .dashboard-card h3 {
            color: #333;
            font-size: 20px;
            margin-bottom: 8px;
        }

        .dashboard-card p {
            color: #777;
            font-size: 15px;
        }

        .dashboard-card .number {
            color: #2E7D32;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* ================= SECTION TITLE ================= */

        .section-title {
            margin-bottom: 20px;
        }

        .section-title h2 {
            color: white;
            font-size: 28px;
        }

        .section-title h2 i {
            color: #c8e6c9;
            margin-right: 10px;
        }

        .section-title p {
            color: #e0e0e0;
            margin-top: 6px;
        }

        /* ================= QUICK ACTIONS ================= */

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .action-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        }

        .action-card h3 {
            color: #333;
            margin-bottom: 10px;
        }

        .action-card p {
            color: #777;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 18px;
            background: #2E7D32;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            margin-right: 8px;
            margin-bottom: 8px;
        }

        .action-btn:hover {
            background: #1B5E20;
        }

        .action-btn i {
            margin-right: 8px;
        }

        /* ================= DISCUSSION SECTION ================= */

        .discussion-section {
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            margin-bottom: 35px;
        }

        .discussion-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .discussion-header h2 {
            color: #222;
            font-size: 26px;
        }

        .discussion-header h2 i {
            color: #2E7D32;
            margin-right: 10px;
        }

        .discussion-count {
            background: #e8f5e9;
            color: #2E7D32;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: bold;
        }

        /* ================= DISCUSSION FORM ================= */

        .discussion-form {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #333;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 13px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
        }

        .form-group textarea {
            min-height: 120px;
            resize: vertical;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            border-color: #2E7D32;
            box-shadow: 0 0 0 3px rgba(46,125,50,0.10);
        }

        .discussion-btn {
            display: inline-flex;
            align-items: center;
            padding: 13px 22px;
            background: #2E7D32;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .discussion-btn:hover {
            background: #1B5E20;
        }

        .discussion-btn i {
            margin-right: 8px;
        }

        /* ================= FOOTER ================= */

        .footer {
            text-align: center;
            color: white;
            padding: 25px;
            margin-top: 20px;
        }

        /* ================= RESPONSIVE ================= */

        @media(max-width: 1000px) {

            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
            }

            .header {
                padding: 0 20px;
            }

            .nav {
                gap: 12px;
            }
        }

        @media(max-width: 700px) {

            .header {
                height: auto;
                padding: 20px;
                flex-direction: column;
                gap: 18px;
            }

            .nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr;
            }

            .welcome h1 {
                font-size: 26px;
            }

            .discussion-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
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

        <a href="${pageContext.request.contextPath}/adminAssignments">
            <i class="fas fa-file-alt"></i>
            Assignments
        </a>

        <a href="viewSubmissions">
            <i class="fas fa-file-upload"></i>
            Submissions
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


<!-- ================= MAIN CONTAINER ================= -->

<div class="container">


    <!-- ================= WELCOME ================= -->

    <div class="welcome">

        <h1>

            <i class="fas fa-user-shield"></i>

            Welcome, <%= adminName %>

        </h1>

        <p>

            Manage your Online Learning Management System
            from the admin dashboard.

        </p>

    </div>


    <!-- ================= DASHBOARD CARDS ================= -->

    <div class="dashboard-grid">


        <!-- COURSES -->

        <div class="dashboard-card">

            <div class="card-icon">

                <i class="fas fa-book"></i>

            </div>

            <h3>Courses</h3>

            <p>
                Manage courses and learning materials.
            </p>

        </div>


        <!-- LIVE CLASSES -->

        <div class="dashboard-card">

            <div class="card-icon">

                <i class="fas fa-video"></i>

            </div>

            <h3>Live Classes</h3>

            <p>
                Schedule and manage live classes.
            </p>

        </div>


        <!-- ASSIGNMENTS -->

        <div class="dashboard-card">

            <div class="card-icon">

                <i class="fas fa-file-alt"></i>

            </div>

            <h3>Assignments</h3>

            <p>
                Create and manage student assignments.
            </p>

        </div>


        <!-- DISCUSSIONS -->

        <div class="dashboard-card">

            <div class="card-icon">

                <i class="fas fa-comments"></i>

            </div>

            <div class="number">

                <%= totalDiscussions %>

            </div>

            <h3>Discussions</h3>

            <p>
                Total discussions created by students.
            </p>

        </div>

    </div>


    <!-- ================= QUICK ACTIONS ================= -->

    <div class="section-title">

        <h2>

            <i class="fas fa-bolt"></i>

            Quick Actions

        </h2>

        <p>

            Quickly access important LMS administration features.

        </p>

    </div>


    <div class="quick-actions">


        <!-- COURSE ACTION -->

        <div class="action-card">

            <h3>

                <i class="fas fa-book"></i>

                Manage Courses

            </h3>

            <p>

                Add, update and manage courses available in the LMS.

            </p>

            <a href="adminCourses" class="action-btn">

                <i class="fas fa-arrow-right"></i>

                Manage Courses

            </a>

        </div>


        <!-- LIVE CLASS ACTION -->

        <div class="action-card">

            <h3>

                <i class="fas fa-video"></i>

                Live Classes

            </h3>

            <p>

                View and manage scheduled live classes.

            </p>

            <a href="viewLiveClasses" class="action-btn">

                <i class="fas fa-arrow-right"></i>

                View Live Classes

            </a>

        </div>


        <!-- ASSIGNMENT ACTION -->

        <div class="action-card">

            <h3>

                <i class="fas fa-file-alt"></i>

                Assignments

            </h3>

            <p>

                Add and manage assignments for students.

            </p>

            <!-- EXISTING MANAGE ASSIGNMENTS BUTTON -->

            <a href="${pageContext.request.contextPath}/adminAssignments"
               class="action-btn">

                <i class="fas fa-list"></i>

                Manage Assignments

            </a>

            <!-- NEW CREATE ASSIGNMENT BUTTON -->

            <a href="${pageContext.request.contextPath}/addAssignment.jsp"
               class="action-btn">

                <i class="fas fa-plus"></i>

                Create Assignment

            </a>

        </div>


        <!-- STUDENT SUBMISSIONS -->

        <div class="action-card">

            <h3>

                <i class="fas fa-file-upload"></i>

                Student Submissions

            </h3>

            <p>

                View and manage assignments submitted by students.

            </p>

            <a href="viewSubmissions" class="action-btn">

                <i class="fas fa-arrow-right"></i>

                View Submissions

            </a>

        </div>


        <!-- ANNOUNCEMENTS -->

        <div class="action-card">

            <h3>

                <i class="fas fa-bullhorn"></i>

                Announcements

            </h3>

            <p>

                Create and manage announcements for students.

            </p>

            <a href="manageAnnouncements.jsp"
               class="action-btn">

                <i class="fas fa-arrow-right"></i>

                Manage Announcements

            </a>

        </div>


        <!-- DISCUSSIONS -->

        <div class="action-card">

            <h3>

                <i class="fas fa-comments"></i>

                Discussions

            </h3>

            <p>

                View discussions and interact with students.

            </p>

            <a href="viewDiscussions"
               class="action-btn">

                <i class="fas fa-arrow-right"></i>

                View Discussions

            </a>

        </div>


        <!-- ADD ADMIN -->

        <div class="action-card">

            <h3>

                <i class="fas fa-user-plus"></i>

                Add Admin

            </h3>

            <p>

                Create another administrator account for the LMS.

            </p>

            <a href="addAdmin.jsp"
               class="action-btn">

                <i class="fas fa-arrow-right"></i>

                Add Admin

            </a>

        </div>

    </div>


    <!-- ================= DISCUSSION FORM ================= -->

    <div class="discussion-section">

        <div class="discussion-header">

            <h2>

                <i class="fas fa-comments"></i>

                Start a Discussion

            </h2>

            <div class="discussion-count">

                <i class="fas fa-comment"></i>

                <%= totalDiscussions %> Discussions

            </div>

        </div>


        <p style="color:#777; margin-bottom:20px;">

            Create a discussion topic for students and faculty.

        </p>


        <form action="addDiscussion"
              method="post"
              class="discussion-form">


            <!-- TITLE -->

            <div class="form-group">

                <label for="title">

                    <i class="fas fa-heading"></i>

                    Discussion Title

                </label>

                <input
                    type="text"
                    id="title"
                    name="title"
                    placeholder="Enter discussion title"
                    required>

            </div>


            <!-- CATEGORY -->

            <div class="form-group">

                <label for="category">

                    <i class="fas fa-layer-group"></i>

                    Category

                </label>

                <select
                    id="category"
                    name="category"
                    required>

                    <option value="">
                        Select Category
                    </option>

                    <option value="General">
                        General
                    </option>

                    <option value="Course">
                        Course Discussion
                    </option>

                    <option value="Assignment">
                        Assignment
                    </option>

                    <option value="Exam">
                        Exam
                    </option>

                    <option value="Technical">
                        Technical
                    </option>

                </select>

            </div>


            <!-- MESSAGE -->

            <div class="form-group">

                <label for="message">

                    <i class="fas fa-align-left"></i>

                    Discussion Message

                </label>

                <textarea
                    id="message"
                    name="message"
                    placeholder="Write your discussion here..."
                    required></textarea>

            </div>


            <!-- SUBMIT -->

            <button
                type="submit"
                class="discussion-btn">

                <i class="fas fa-paper-plane"></i>

                Start Discussion

            </button>

        </form>

    </div>


    <!-- ================= FOOTER ================= -->

    <div class="footer">

        <p>

            <i class="fas fa-graduation-cap"></i>

            Online Learning Management System

        </p>

        <p style="margin-top:8px;">

            Admin Dashboard

        </p>

    </div>

</div>

</body>

</html>
