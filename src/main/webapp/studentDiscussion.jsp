
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lms.model.Discussion" %>

<%
    // Check student login
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<Discussion> discussions =
        (ArrayList<Discussion>) request.getAttribute("discussions");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Discussion Forum - LMS</title>

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
            font-size: 14px;
        }

        .nav a:hover {
            color: #2E7D32;
        }

        /* MAIN */

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .page-header {
            margin-bottom: 30px;
        }

        .page-header h1 {
            color: #222;
            font-size: 34px;
            margin-bottom: 8px;
        }

        .page-header h1 i {
            color: #2E7D32;
            margin-right: 10px;
        }

        .page-header p {
            color: #777;
            font-size: 17px;
        }

        /* ASK QUESTION */

        .ask-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            margin-bottom: 35px;
        }

        .ask-box h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .ask-box textarea {
            width: 100%;
            min-height: 120px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            resize: vertical;
            font-size: 16px;
            outline: none;
        }

        .ask-box textarea:focus {
            border-color: #2E7D32;
            box-shadow: 0 0 0 3px rgba(46,125,50,0.10);
        }

        .ask-btn {
            margin-top: 15px;
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            background: #2E7D32;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .ask-btn:hover {
            background: #1B5E20;
        }

        /* DISCUSSION CARD */

        .discussion-card {
            background: white;
            padding: 28px;
            margin-bottom: 22px;
            border-radius: 15px;
            border-left: 5px solid #2E7D32;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        }

        .question-title {
            color: #333;
            font-size: 20px;
            margin-bottom: 12px;
        }

        .question-title i {
            color: #2E7D32;
            margin-right: 8px;
        }

        .question-text {
            color: #555;
            font-size: 16px;
            line-height: 1.7;
            margin-bottom: 18px;
        }

        .discussion-info {
            color: #888;
            font-size: 14px;
            margin-bottom: 15px;
        }

        /* REPLY */

        .reply-box {
            background: #e8f5e9;
            padding: 18px;
            border-radius: 10px;
            margin-top: 15px;
        }

        .reply-title {
            color: #2E7D32;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .reply-text {
            color: #444;
            line-height: 1.7;
        }

        /* PENDING */

        .pending-box {
            background: #f5f5f5;
            padding: 15px;
            border-radius: 10px;
            color: #888;
            font-style: italic;
            margin-top: 15px;
        }

        /* EMPTY */

        .empty-box {
            background: white;
            padding: 50px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        }

        .empty-box i {
            font-size: 55px;
            color: #2E7D32;
            margin-bottom: 18px;
        }

        .empty-box h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .empty-box p {
            color: #777;
        }

        /* BACK */

        .back-btn {
            display: inline-block;
            margin-top: 10px;
            margin-bottom: 40px;
            color: #2E7D32;
            text-decoration: none;
            font-weight: 600;
        }

        .back-btn:hover {
            text-decoration: underline;
        }

        /* RESPONSIVE */

        @media(max-width: 800px) {

            .header {
                height: auto;
                padding: 20px;
                flex-direction: column;
                gap: 15px;
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

<!-- HEADER -->

<div class="header">

    <div class="logo">

        <i class="fas fa-graduation-cap"></i>

        LMS Student Portal

    </div>

    <div class="nav">


        <a href="viewCourses">
            <i class="fas fa-book"></i>
            Courses
        </a>

        <a href="viewAssignments">
            <i class="fas fa-file-alt"></i>
            Assignments
        </a>

       

        <a href="logout">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </a>

    </div>

</div>


<!-- MAIN -->

<div class="container">

    <div class="page-header">

        <h1>

            <i class="fas fa-comments"></i>

            Discussion Forum

        </h1>

        <p>

            Ask questions and view replies from faculty.

        </p>

    </div>


    <!-- ASK QUESTION -->

    <div class="ask-box">

        <h2>

            <i class="fas fa-question-circle"></i>

            Ask a Question

        </h2>

        <form action="addDiscussion" method="post">

            <input type="hidden"
                   name="studentId"
                   value="<%= session.getAttribute("studentId") %>">

            <input type="hidden"
                   name="courseId"
                   value="1">

            <textarea
                name="question"
                placeholder="Enter your question here..."
                required></textarea>

            <br>

            <button type="submit" class="ask-btn">

                <i class="fas fa-paper-plane"></i>

                Post Question

            </button>

        </form>

    </div>


    <!-- DISCUSSION LIST -->

    <%
        if (discussions != null && !discussions.isEmpty()) {

            for (Discussion d : discussions) {
    %>

        <div class="discussion-card">

            <div class="question-title">

                <i class="fas fa-question-circle"></i>

                Question

            </div>

            <div class="question-text">

                <%= d.getQuestion() %>

            </div>

            <div class="discussion-info">

                <i class="fas fa-book"></i>

                Course ID: <%= d.getCourseId() %>

                &nbsp;&nbsp; | &nbsp;&nbsp;

                <i class="fas fa-calendar"></i>

                <%= d.getPostedDate() %>

            </div>


            <%
                if (d.getReply() != null &&
                    !d.getReply().trim().isEmpty()) {
            %>

                <div class="reply-box">

                    <div class="reply-title">

                        <i class="fas fa-reply"></i>

                        Faculty Reply

                    </div>

                    <div class="reply-text">

                        <%= d.getReply() %>

                    </div>

                </div>

            <%
                } else {
            %>

                <div class="pending-box">

                    <i class="fas fa-clock"></i>

                    Waiting for faculty reply...

                </div>

            <%
                }
            %>

        </div>

    <%
            }

        } else {
    %>

        <div class="empty-box">

            <i class="fas fa-comments"></i>

            <h2>

                No Discussions Yet

            </h2>

            <p>

                You have not posted any questions yet.

            </p>

        </div>

    <%
        }
    %>


   

</div>

</body>

</html>
