
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
    // GET ASSIGNMENTS
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
    box-sizing: border-box;
}

body {

    margin: 0;

    background: #f4f6f9;

    font-family: "Segoe UI", Arial, sans-serif;

}

/* ==========================================
   HEADER
========================================== */

.header {

    background: #2E7D32;

    color: white;

    padding: 20px 45px;

    display: flex;

    justify-content: space-between;

    align-items: center;

}

.logo {

    font-size: 24px;

    font-weight: bold;

}

.nav a {

    color: white;

    text-decoration: none;

    margin-left: 25px;

    font-weight: 600;

}

.nav a:hover {

    text-decoration: underline;

}

/* ==========================================
   CONTAINER
========================================== */

.container {

    width: 90%;

    max-width: 1100px;

    margin: 40px auto;

}

/* ==========================================
   TITLE
========================================== */

.title {

    font-size: 32px;

    color: #222;

    margin-bottom: 8px;

}

.subtitle {

    color: #666;

    margin-bottom: 30px;

    font-size: 16px;

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

    border-top: 4px solid #2E7D32;

    box-shadow:
        0 6px 18px rgba(0,0,0,0.08);

}

/* ==========================================
   ICON
========================================== */

.assignment-icon {

    width: 55px;

    height: 55px;

    border-radius: 12px;

    background: #e8f5e9;

    color: #2E7D32;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 24px;

    margin-bottom: 18px;

}

/* ==========================================
   HEADING
========================================== */

.assignment-card h2 {

    color: #222;

    margin-bottom: 18px;

}

/* ==========================================
   INFORMATION
========================================== */

.info {

    margin: 14px 0;

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

    padding: 11px 20px;

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

    margin-top: 18px;

}

.upload-form input[type="file"] {

    width: 100%;

    margin-bottom: 12px;

    padding: 8px;

    border: 1px solid #ddd;

    border-radius: 6px;

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
   SUBMISSION RESULT
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

    color: #2E7D32;

}

.result-info {

    margin: 10px 0;

    color: #444;

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
   EVALUATED BADGE
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

    margin-top: 20px;

    padding: 14px;

    background: #fff8e1;

    border-left: 5px solid #f9a825;

    border-radius: 8px;

    color: #795548;

    font-weight: 600;

}

/* ==========================================
   EMPTY
========================================== */

.empty {

    background: white;

    padding: 50px;

    text-align: center;

    border-radius: 15px;

    box-shadow:
        0 6px 18px rgba(0,0,0,0.08);

}

.empty i {

    font-size: 45px;

    color: #2E7D32;

    margin-bottom: 15px;

}

/* ==========================================
   RESPONSIVE
========================================== */

@media(max-width:700px) {

    .header {

        flex-direction: column;

        gap: 15px;

        padding: 20px;

    }

    .nav {

        text-align: center;

    }

    .nav a {

        display: inline-block;

        margin: 5px;

    }

    .container {

        width: 94%;

    }

    .assignment-grid {

        grid-template-columns: 1fr;

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

        LMS Student Portal

    </div>


    <div class="nav">

        <a href="studentDashboard.jsp">

            <i class="fas fa-home"></i>

            Dashboard

        </a>


        <a href="viewCourses">

            <i class="fas fa-book"></i>

            Courses

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
     MAIN CONTAINER
========================================== -->

<div class="container">


    <h1 class="title">

        <i class="fas fa-file-alt"></i>

        Assignments

    </h1>


    <p class="subtitle">

        View assignments, submit your solutions,
        and check your marks and faculty feedback.

    </p>


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
     ASSIGNMENT GRID
========================================== -->

<div class="assignment-grid">


<%

    if (assignmentList != null &&
        !assignmentList.isEmpty()) {


        for (Assignment a : assignmentList) {


            // ==================================
            // ASSIGNMENT FILE
            // ==================================

            String title =
                    a.getTitle();

            String fileName = "";


            if (title != null) {

                String lowerTitle =
                        title.toLowerCase();


                if (lowerTitle.contains("java")) {

                    fileName =
                            "java-assignment.txt";

                }

                else if (lowerTitle.contains("python")) {

                    fileName =
                            "python-assignment.txt";
                }

            }


            // ==================================
            // GET STUDENT SUBMISSION
            // ==================================

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

        <strong>Assignment Status:</strong>

        <span class="status">

            <%= a.getStatus() %>

        </span>

    </div>


<%

    // =========================================
    // DOWNLOAD ASSIGNMENT
    // =========================================

    if (!fileName.isEmpty()) {

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

    // =========================================
    // STUDENT HAS NOT SUBMITTED
    // =========================================

    if (submission == null) {

%>


    <form
        action="<%= request.getContextPath() %>/submitAssignment"
        method="post"
        enctype="multipart/form-data"
        class="upload-form">


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

            <i class="fas fa-upload"></i>

            Submit Assignment

        </button>


    </form>


<%

    }

    // =========================================
    // STUDENT HAS SUBMITTED
    // =========================================

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

        // =====================================
        // MARKS HAVE BEEN GIVEN
        // =====================================

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

                !submission.getFeedback()
                    .trim()
                    .isEmpty()) {

%>

                <%= submission.getFeedback() %>

<%

            }

            else {

%>

                No feedback provided.

<%

            }

%>

            </div>

        </div>


<%

        }

        // =====================================
        // MARKS NOT GIVEN YET
        // =====================================

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

    }

    else {

%>


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


</div>


</body>

</html>