
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Assignment"%>

<%
    // ==========================================
    // ADMIN LOGIN CHECK
    // ==========================================

    if (session.getAttribute("adminName") == null) {

        response.sendRedirect("adminLogin.jsp");
        return;
    }

    String adminName =
            (String) session.getAttribute("adminName");

    // ==========================================
    // GET ASSIGNMENTS
    // ==========================================

    List<Assignment> assignments =
            (List<Assignment>) request.getAttribute("assignments");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Manage Assignments - LMS Admin</title>

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

        /* ==========================================
           HEADER
           ========================================== */

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

        /* ==========================================
           CONTAINER
           ========================================== */

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 40px auto;
        }

        /* ==========================================
           PAGE HEADER
           ========================================== */

        .page-header {
            background: linear-gradient(
                135deg,
                #2E7D32,
                #43A047
            );

            color: white;

            padding: 30px;

            border-radius: 18px;

            margin-bottom: 30px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.12);
        }

        .page-header h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }

        .page-header p {
            font-size: 16px;
            opacity: 0.95;
        }

        /* ==========================================
           TOP ACTIONS
           ========================================== */

        .top-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;

            padding: 12px 18px;

            background: #2E7D32;

            color: white;

            text-decoration: none;

            border-radius: 8px;

            font-weight: bold;
        }

        .back-btn:hover {
            background: #1B5E20;
        }

        .count {
            background: #e8f5e9;
            color: #2E7D32;

            padding: 10px 16px;

            border-radius: 20px;

            font-weight: bold;
        }

        /* ==========================================
           TABLE CARD
           ========================================== */

        .table-card {
            background: white;

            border-radius: 16px;

            padding: 25px;

            box-shadow:
                0 6px 20px rgba(0,0,0,0.08);

            overflow-x: auto;
        }

        table {
            width: 100%;

            border-collapse: collapse;

            min-width: 950px;
        }

        th {
            background: #2E7D32;

            color: white;

            padding: 15px;

            text-align: left;

            font-size: 14px;
        }

        td {
            padding: 15px;

            border-bottom: 1px solid #eee;

            color: #444;

            vertical-align: middle;
        }

        tr:hover td {
            background: #f8faf8;
        }

        /* ==========================================
           TITLE
           ========================================== */

        .title {
            font-weight: bold;
            color: #222;
        }

        .description {
            max-width: 250px;
            line-height: 1.5;
            color: #666;
        }

        /* ==========================================
           STATUS
           ========================================== */

        .status {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            background: #e8f5e9;

            color: #2E7D32;

            font-weight: bold;

            font-size: 13px;
        }

        /* ==========================================
           TYPE
           ========================================== */

        .type {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            background: #f1f8e9;

            color: #558b2f;

            font-size: 13px;

            font-weight: 600;
        }

        /* ==========================================
           FILE
           ========================================== */

        .file-name {
            color: #555;

            word-break: break-word;
        }

        .no-file {
            color: #999;

            font-style: italic;
        }

        /* ==========================================
           DELETE BUTTON
           ========================================== */

        .delete-btn {
            border: none;

            background: #c62828;

            color: white;

            padding: 9px 13px;

            border-radius: 7px;

            cursor: pointer;

            font-weight: bold;
        }

        .delete-btn:hover {
            background: #8e0000;
        }

        /* ==========================================
           EMPTY
           ========================================== */

        .empty {
            text-align: center;

            padding: 60px 20px;

            color: #777;
        }

        .empty i {
            font-size: 55px;

            color: #bdbdbd;

            margin-bottom: 20px;
        }

        .empty h2 {
            color: #444;

            margin-bottom: 10px;
        }

        /* ==========================================
           FOOTER
           ========================================== */

        .footer {
            text-align: center;

            color: #777;

            padding: 30px;
        }

        /* ==========================================
           RESPONSIVE
           ========================================== */

        @media(max-width: 900px) {

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
            }
        }

    </style>

</head>

<body>

<!-- ==========================================
     HEADER
     ========================================== -->

<div class="header">

    <div class="logo">

        <i class="fas fa-graduation-cap"></i>

        LMS Admin Portal

    </div>

    <div class="nav">

        <a href="${pageContext.request.contextPath}/adminDashboard.jsp">
            <i class="fas fa-home"></i>
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/adminCourses">
            <i class="fas fa-book"></i>
            Courses
        </a>

        <a href="${pageContext.request.contextPath}/viewLiveClasses">
            <i class="fas fa-video"></i>
            Live Classes
        </a>

        <a href="${pageContext.request.contextPath}/adminAssignments">
            <i class="fas fa-file-alt"></i>
            Assignments
        </a>

        <a href="${pageContext.request.contextPath}/viewSubmissions">
            <i class="fas fa-file-upload"></i>
            Submissions
        </a>

        <a href="${pageContext.request.contextPath}/manageAnnouncements.jsp">
            <i class="fas fa-bullhorn"></i>
            Announcements
        </a>

        <a href="${pageContext.request.contextPath}/adminLogout">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </a>

    </div>

</div>


<!-- ==========================================
     MAIN
     ========================================== -->

<div class="container">

    <!-- PAGE HEADER -->

    <div class="page-header">

        <h1>
            <i class="fas fa-file-alt"></i>
            Manage Assignments
        </h1>

        <p>
            Welcome, <%= adminName %>.
            View and manage assignments created for students.
        </p>

    </div>


    <!-- TOP ACTIONS -->

    <div class="top-actions">

        <a href="${pageContext.request.contextPath}/adminDashboard.jsp"
           class="back-btn">

            <i class="fas fa-arrow-left"></i>

            Back to Dashboard

        </a>


        <div class="count">

            <i class="fas fa-file-alt"></i>

            <%= assignments == null ? 0 : assignments.size() %>
            Assignments

        </div>

    </div>


    <!-- TABLE -->

    <div class="table-card">

        <%
            if (assignments != null &&
                !assignments.isEmpty()) {
        %>

        <table>

            <thead>

                <tr>

                    <th>ID</th>

                    <th>Course ID</th>

                    <th>Title</th>

                    <th>Description</th>

                    <th>Due Date</th>

                    <th>File</th>

                    <th>Max Marks</th>

                    <th>Type</th>

                    <th>Status</th>

                    <th>Action</th>

                </tr>

            </thead>

            <tbody>

            <%
                for (Assignment a : assignments) {
            %>

                <tr>

                    <td>
                        <%= a.getId() %>
                    </td>

                    <td>
                        <%= a.getCourseId() %>
                    </td>

                    <td class="title">
                        <%= a.getTitle() %>
                    </td>

                    <td class="description">
                        <%= a.getDescription() == null
                            ? "-"
                            : a.getDescription() %>
                    </td>

                    <td>
                        <%= a.getDueDate() == null
                            ? "-"
                            : a.getDueDate() %>
                    </td>

                    <td>

                        <%
                            if (a.getFileName() != null &&
                                !a.getFileName().trim().isEmpty()) {
                        %>

                            <span class="file-name">
                                <i class="fas fa-paperclip"></i>
                                <%= a.getFileName() %>
                            </span>

                        <%
                            } else {
                        %>

                            <span class="no-file">
                                No file
                            </span>

                        <%
                            }
                        %>

                    </td>

                    <td>
                        <%= a.getMaxMarks() %>
                    </td>

                    <td>

                        <span class="type">
                            <%= a.getAssignmentType() == null
                                ? "-"
                                : a.getAssignmentType() %>
                        </span>

                    </td>

                    <td>

                        <span class="status">
                            <%= a.getStatus() == null
                                ? "-"
                                : a.getStatus() %>
                        </span>

                    </td>

                    <td>

                        <form
                            action="${pageContext.request.contextPath}/adminAssignments"
                            method="post"
                            onsubmit="return confirm('Are you sure you want to delete this assignment?');">

                            <input
                                type="hidden"
                                name="action"
                                value="delete">

                            <input
                                type="hidden"
                                name="id"
                                value="<%= a.getId() %>">

                            <button
                                type="submit"
                                class="delete-btn">

                                <i class="fas fa-trash"></i>

                                Delete

                            </button>

                        </form>

                    </td>

                </tr>

            <%
                }
            %>

            </tbody>

        </table>

        <%
            } else {
        %>

        <div class="empty">

            <i class="fas fa-file-circle-xmark"></i>

            <h2>
                No Assignments Available
            </h2>

            <p>
                There are currently no assignments in the system.
            </p>

        </div>

        <%
            }
        %>

    </div>


    <!-- FOOTER -->

    <div class="footer">

        <p>
            <i class="fas fa-graduation-cap"></i>
            Online Learning Management System
        </p>

    </div>

</div>

</body>

</html>
