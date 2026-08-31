
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.lms.model.Discussion"%>

<%
    // ADMIN LOGIN CHECK
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    ArrayList<Discussion> discussions =
        (ArrayList<Discussion>) request.getAttribute("discussions");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Discussion Forum - Admin</title>

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
    background: #ffffff;
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
    margin-right: 8px;
}

.nav a {
    text-decoration: none;
    color: #444;
    margin-left: 22px;
    font-weight: 600;
}

.nav a:hover {
    color: #2E7D32;
}

/* CONTAINER */

.container {
    width: 92%;
    max-width: 1200px;
    margin: 40px auto;
}

/* TITLE */

.title-box {
    background: linear-gradient(135deg, #2E7D32, #43A047);
    color: white;
    padding: 30px;
    border-radius: 15px;
    margin-bottom: 30px;
}

.title-box h1 {
    font-size: 30px;
    margin-bottom: 8px;
}

.title-box p {
    font-size: 16px;
}

/* DISCUSSION CARD */

.discussion-card {
    background: white;
    border-radius: 15px;
    padding: 25px;
    margin-bottom: 22px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.08);
    border-left: 5px solid #2E7D32;
}

/* TOP */

.discussion-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
}

.discussion-id {
    color: #777;
    font-size: 14px;
}

.status {
    background: #e8f5e9;
    color: #2E7D32;
    padding: 7px 15px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: bold;
}

/* DETAILS */

.details {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
    margin-bottom: 20px;
}

.detail {
    background: #f8f9fa;
    padding: 12px;
    border-radius: 8px;
}

.detail strong {
    color: #333;
}

.detail i {
    color: #2E7D32;
    margin-right: 7px;
}

/* QUESTION */

.question-box {
    background: #f4f6f9;
    padding: 18px;
    border-radius: 10px;
    margin-bottom: 18px;
}

.question-box h3 {
    color: #2E7D32;
    margin-bottom: 10px;
}

.question-box p {
    color: #444;
    line-height: 1.6;
}

/* REPLY FORM */

.reply-form {
    margin-top: 20px;
    padding: 20px;
    background: #f4f6f9;
    border-radius: 10px;
}

.reply-form h3 {
    color: #2E7D32;
    margin-bottom: 15px;
}

.reply-form textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    resize: vertical;
    font-size: 15px;
    margin-bottom: 12px;
}

.reply-form button {
    padding: 11px 20px;
    background: #2E7D32;
    color: white;
    border: none;
    border-radius: 7px;
    cursor: pointer;
    font-weight: bold;
}

.reply-form button:hover {
    background: #1B5E20;
}

/* EXISTING REPLY */

.reply-box {
    margin-top: 20px;
    padding: 20px;
    background: #e8f5e9;
    border-left: 4px solid #2E7D32;
    border-radius: 8px;
}

.reply-box h3 {
    color: #2E7D32;
    margin-bottom: 10px;
}

.reply-box p {
    color: #444;
    line-height: 1.6;
}

/* EMPTY */

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

/* RESPONSIVE */

@media(max-width:700px) {

    .header {
        flex-direction: column;
        gap: 15px;
    }

    .nav {
        text-align: center;
    }

    .nav a {
        display: inline-block;
        margin: 5px;
    }

    .details {
        grid-template-columns: 1fr;
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

    <div class="nav">

        <a href="adminDashboard.jsp">
            <i class="fas fa-home"></i>
            Dashboard
        </a>

        <a href="adminCourses">
            <i class="fas fa-book"></i>
            Courses
        </a>

        <a href="adminAssignments">
            <i class="fas fa-file-alt"></i>
            Assignments
        </a>

        <a href="viewDiscussions">
            <i class="fas fa-comments"></i>
            Discussions
        </a>

        <a href="adminLogout">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </a>

    </div>

</div>


<!-- MAIN -->

<div class="container">

    <div class="title-box">

        <h1>
            <i class="fas fa-comments"></i>
            Discussion Forum
        </h1>

        <p>
            View and manage discussions submitted by students.
        </p>

    </div>


<%
if (discussions != null && !discussions.isEmpty()) {

    for (Discussion d : discussions) {
%>

    <div class="discussion-card">

        <!-- TOP -->

        <div class="discussion-top">

            <div class="discussion-id">

                <i class="fas fa-hashtag"></i>

                Discussion ID:
                <%= d.getId() %>

            </div>

            <div class="status">

                <i class="fas fa-check-circle"></i>

                Completed

            </div>

        </div>


        <!-- STUDENT / COURSE DETAILS -->

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


        <!-- QUESTION -->

        <div class="question-box">

            <h3>

                <i class="fas fa-question-circle"></i>

                Student Question

            </h3>

            <p>
                <%= d.getQuestion() %>
            </p>

        </div>


        <!-- REPLY -->

<%
        if (d.getReply() != null &&
            !d.getReply().trim().isEmpty()) {
%>

        <!-- ALREADY REPLIED -->

        <div class="reply-box">

            <h3>

                <i class="fas fa-reply"></i>

                Faculty Reply

            </h3>

            <p>
                <%= d.getReply() %>
            </p>

        </div>

<%
        } else {
%>

        <!-- REPLY FORM -->

        <div class="reply-form">

            <h3>

                <i class="fas fa-reply"></i>

                Reply to Student

            </h3>

            <form action="replyDiscussion" method="post">

                <input type="hidden"
                       name="id"
                       value="<%= d.getId() %>">

                <textarea
                    name="reply"
                    placeholder="Enter your reply..."
                    rows="4"
                    required></textarea>

                <button type="submit">

                    <i class="fas fa-paper-plane"></i>

                    Send Reply

                </button>

            </form>

        </div>

<%
        }
%>

    </div>

<%
    }

} else {
%>

    <div class="empty">

        <i class="fas fa-comments"></i>

        <h2>No Discussions Available</h2>

        <p>
            There are currently no discussions submitted by students.
        </p>

    </div>

<%
}
%>

</div>

</body>

</html>
