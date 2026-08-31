
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Assignment"%>
<%@ page import="com.lms.dao.AssignmentSubmissionDAO"%>
<%@ page import="com.lms.model.AssignmentSubmission"%>

<%
    // ==========================================
    // STUDENT LOGIN CHECK
    // ==========================================

    if (session.getAttribute("studentId") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    int studentId =
            (Integer) session.getAttribute("studentId");

    // ==========================================
    // GET ASSIGNMENTS FROM SERVLET
    // ==========================================

    List<Assignment> assignmentList =
            (List<Assignment>) request.getAttribute("assignments");

    AssignmentSubmissionDAO submissionDAO =
            new AssignmentSubmissionDAO();
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Assignments - LMS Student Portal</title>

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

        /* ==========================================
           CONTAINER
        ========================================== */

        .container {
            width: 90%;
            max-width: 1150px;
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

            border-radius: 16px;

            margin-bottom: 30px;

            box-shadow:
                0 6px 20px rgba(0,0,0,0.10);
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
           SUCCESS MESSAGE
        ========================================== */

        .success {
            background: #e8f5e9;
            border-left: 5px solid #2E7D32;

            color: #1B5E20;

            padding: 15px 18px;

            border-radius: 8px;

            margin-bottom: 25px;

            font-weight: 600;
        }

        /* ==========================================
           ASSIGNMENT GRID
        ========================================== */

        .assignment-grid {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(350px, 1fr));

            gap: 25px;
        }

        /* ==========================================
           ASSIGNMENT CARD
        ========================================== */

        .assignment-card {
            background: white;

            padding: 28px;

            border-radius: 15px;

            border-top: 5px solid #2E7D32;

            box-shadow:
                0 6px 18px rgba(0,0,0,0.08);

            transition: 0.3s;
        }

        .assignment-card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 10px 25px rgba(0,0,0,0.12);
        }

        /* ==========================================
           ICON
        ========================================== */

        .assignment-icon {
            width: 58px;
            height: 58px;

            border-radius: 12px;

            background: #e8f5e9;

            color: #2E7D32;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 25px;

            margin-bottom: 18px;
        }

        /* ==========================================
           TITLE
        ========================================== */

        .assignment-card h2 {
            color: #222;

            font-size: 22px;

            margin-bottom: 18px;
        }

        /* ==========================================
           INFORMATION
        ========================================== */

        .info {
            margin: 13px 0;

            color: #555;

            line-height: 1.6;
        }

        .info i {
            width: 25px;

            color: #2E7D32;
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

            font-size: 12px;

            font-weight: bold;
        }

        /* ==========================================
           DOWNLOAD BUTTON
        ========================================== */

        .download-btn {
            display: inline-flex;

            align-items: center;

            gap: 8px;

            margin-top: 18px;

            padding: 11px 18px;

            background: #2E7D32;

            color: white;

            text-decoration: none;

            border-radius: 7px;

            font-weight: 600;
        }

        .download-btn:hover {
            background: #1B5E20;
        }

        /* ==========================================
           UPLOAD FORM
        ========================================== */

        .upload-form {
            margin-top: 20px;

            padding-top: 18px;

            border-top: 1px solid #eee;
        }

        .upload-form label {
            display: block;

            margin-bottom: 8px;

            color: #333;

            font-weight: 600;
        }

        .upload-form input[type="file"] {
            width: 100%;

            margin-bottom: 12px;

            padding: 9px;

            border: 1px solid #ddd;

            border-radius: 6px;

            background: #fafafa;
        }

        .submit-btn {
            background: #1565C0;

            color: white;

            padding: 11px 18px;

            border-radius: 6px;

            border: none;

            cursor: pointer;

            font-weight: bold;
        }

        .submit-btn:hover {
            background: #0D47A1;
        }

        /* ==========================================
           RESULT BOX
        ========================================== */

        .result-box {
            margin-top: 22px;

            padding: 18px;

            background: #f8f9fa;

            border-radius: 10px;

            border-left: 5px solid #2E7D32;
        }

        .result-box h3 {
            margin-top: 0;

            margin-bottom: 15px;

            color: #2E7D32;
        }

        .result-info {
            margin: 10px 0;

            color: #444;

            line-height: 1.5;
        }

        /* ==========================================
           EVALUATED
        ========================================== */

        .evaluated {
            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            background: #e8f5e9;

            color: #2E7D32;

            font-size: 12px;

            font-weight: bold;
        }

        /* ==========================================
           NOT EVALUATED
        ========================================== */

        .not-evaluated {
            margin-top: 18px;

            padding: 14px;

            background: #fff8e1;

            border-left: 5px solid #f9a825;

            border-radius: 8px;

            color: #795548;

            font-weight: 600;
        }

        /* ==========================================
           MARKS
        ========================================== */

        .marks {
            font-size: 24px;

            font-weight: bold;

            color: #1565C0;
        }

        /* ==========================================
           FEEDBACK
        ========================================== */

        .feedback {
            background: white;

            padding: 12px;

            border-radius: 7px;

            margin-top: 8px;

            color: #555;

            line-height: 1.5;
        }

        /* ==========================================
           EMPTY
        ========================================== */

        .empty {
            background: white;

            padding: 60px 30px;

            text-align: center;

            border-radius: 15px;

            box-shadow:
                0 6px 18px rgba(0,0,0,0.08);
        }

        .empty i {
            font-size: 50px;

            color: #2E7D32;

            margin-bottom: 18px;
        }

        .empty h2 {
            color: #333;

            margin-bottom: 8px;
        }

        .empty p {
            color: #777;
        }

        /* ==========================================
           BACK BUTTON
        ========================================== */

        .back-btn {
            display: inline-flex;

            align-items: center;

            gap: 8px;

            margin-top: 25px;

            padding: 11px 18px;

            background: #64748b;

            color: white;

            text-decoration: none;

            border-radius: 7px;

            font-weight: 600;
        }

        .back-btn:hover {
            background: #475569;
        }

        /* ==========================================
           RESPONSIVE
        ========================================== */

        @media(max-width: 900px) {

            .header {
                flex-direction: column;

                gap: 15px;

                padding: 20px;
            }

            .nav {
                flex-wrap: wrap;

                justify-content: center;
            }

            .assignment-grid {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

<!-- ==========================================
     STUDENT HEADER
========================================== -->

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

        <a href="studentLiveClasses">

            <i class="fas fa-video"></i>

            Live Classes

        </a>

      

        <a href="studentProfile">

            <i class="fas fa-user"></i>

            Profile

        </a>

        <a href="logout">

            <i class="fas fa-sign-out-alt"></i>

            Logout

        </a>

    </div>

</div>


<!-- ==========================================
     MAIN
========================================== -->

<div class="container">

    <div class="page-header">

        <h1>

            <i class="fas fa-file-alt"></i>

            Assignments

        </h1>

        <p>

            View your assignments, submit your work,

            and check your marks and faculty feedback.

        </p>

    </div>


<%
    // ==========================================
    // SUCCESS MESSAGE
    // ==========================================

    String success =
            request.getParameter("success");

    if ("submitted".equals(success)) {
%>

    <div class="success">

        <i class="fas fa-check-circle"></i>

        Assignment submitted successfully.

    </div>

<%
    }
%>


<!-- ==========================================
     ASSIGNMENT LIST
========================================== -->

<div class="assignment-grid">

<%

    if (assignmentList != null &&
        !assignmentList.isEmpty()) {

        for (Assignment a : assignmentList) {

            AssignmentSubmission submission =
                    submissionDAO.getSubmission(
                            a.getId(),
                            studentId
                    );
%>


<!-- ==========================================
     ASSIGNMENT CARD
========================================== -->

<div class="assignment-card">

    <div class="assignment-icon">

        <i class="fas fa-file-alt"></i>

    </div>


    <h2>

        <%= a.getTitle() %>

    </h2>


    <div class="info">

        <i class="fas fa-align-left"></i>

        <strong>Description:</strong>

        <%= a.getDescription() %>

    </div>


    <div class="info">

        <i class="fas fa-calendar"></i>

        <strong>Due Date:</strong>

        <%= a.getDueDate() %>

    </div>


    <div class="info">

        <i class="fas fa-star"></i>

        <strong>Maximum Marks:</strong>

        <%= a.getMaxMarks() %>

    </div>


    <div class="info">

        <i class="fas fa-circle-check"></i>

        <strong>Status:</strong>

        <span class="status">

            <%= a.getStatus() %>

        </span>

    </div>


<%
    /*
     * If your Assignment model contains getFileName(),
     * use the following block.
     */
%>

<%
    String fileName = null;

    try {

        fileName = a.getFileName();

    } catch (Exception e) {

        fileName = null;
    }

    if (fileName != null &&
        !fileName.trim().isEmpty()) {
%>

    <a
        href="<%= request.getContextPath() %>/files/<%= fileName %>"
        class="download-btn"
        download="<%= fileName %>">

        <i class="fas fa-download"></i>

        Download Assignment

    </a>

<%
    }
%>


<%
    // ==========================================
    // NOT SUBMITTED
    // ==========================================

    if (submission == null) {
%>

    <form
        action="<%= request.getContextPath() %>/submitAssignment"
        method="post"
        enctype="multipart/form-data"
        class="upload-form">

        <label>

            <i class="fas fa-upload"></i>

            Submit Your Assignment

        </label>

        <input
            type="hidden"
            name="assignmentId"
            value="<%= a.getId() %>">

        <input
            type="file"
            name="file"
            required>

        <button
            type="submit"
            class="submit-btn">

            <i class="fas fa-paper-plane"></i>

            Submit Assignment

        </button>

    </form>

<%
    }

    // ==========================================
    // SUBMITTED
    // ==========================================

    else {
%>

    <div class="result-box">

        <h3>

            <i class="fas fa-check-circle"></i>

            Submission Details

        </h3>


        <div class="result-info">

            <strong>Submitted File:</strong>

            <%= submission.getFileName() %>

        </div>


        <div class="result-info">

            <strong>Submitted On:</strong>

            <%= submission.getSubmittedAt() %>

        </div>


<%
        // ======================================
        // EVALUATED
        // ======================================

        if (submission.getMarks() != null) {
%>

        <div class="result-info">

            <strong>Evaluation Status:</strong>

            <span class="evaluated">

                <i class="fas fa-check"></i>

                Evaluated

            </span>

        </div>


        <div class="result-info">

            <strong>Marks:</strong>

            <span class="marks">

                <%= submission.getMarks() %>

                /

                <%= a.getMaxMarks() %>

            </span>

        </div>


        <div class="result-info">

            <strong>Faculty Feedback:</strong>

            <div class="feedback">

<%
            if (submission.getFeedback() != null &&
                !submission.getFeedback().trim().isEmpty()) {
%>

                <%= submission.getFeedback() %>

<%
            } else {
%>

                No feedback provided.

<%
            }
%>

            </div>

        </div>


<%
        }

        // ======================================
        // NOT EVALUATED
        // ======================================

        else {
%>

        <div class="not-evaluated">

            <i class="fas fa-hourglass-half"></i>

            Assignment submitted successfully.

            Marks are not published yet.

        </div>

<%
        }
%>

    </div>

<%
    }
%>

</div>


<%
        }

    } else {
%>


<!-- ==========================================
     EMPTY
========================================== -->

<div class="empty">

    <i class="fas fa-file-circle-xmark"></i>

    <h2>

        No Assignments Available

    </h2>

    <p>

        There are currently no assignments available.

    </p>

</div>


<%
    }
%>

</div>


<a href="studentDashboard.jsp"
   class="back-btn">

    <i class="fas fa-arrow-left"></i>

    Back to Student Dashboard

</a>

</div>

</body>

</html>
