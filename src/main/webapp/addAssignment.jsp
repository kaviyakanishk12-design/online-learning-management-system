s
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Admin login check
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Add Assignment - LMS Admin</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e8f5e9, #f4f6f9);
            margin: 0;
            min-height: 100vh;
            padding: 40px 0;
        }

        .container {
            width: 500px;
            max-width: 90%;
            margin: 20px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,.15);
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-weight: bold;
            color: #333;
            margin-top: 15px;
            margin-bottom: 6px;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
        }

        input:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: #2e7d32;
            box-shadow: 0 0 0 2px rgba(46,125,50,.12);
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 25px;
            background: #2e7d32;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        button:hover {
            background: #1b5e20;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #2e7d32;
            text-decoration: none;
            font-weight: bold;
        }

        .back:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Add Assignment</h2>

    <form action="addAssignment" method="post">

        <label for="courseId">Course ID</label>

        <input
            type="number"
            id="courseId"
            name="courseId"
            min="1"
            required>


        <label for="title">Assignment Title</label>

        <input
            type="text"
            id="title"
            name="title"
            maxlength="100"
            required>


        <label for="description">Description</label>

        <textarea
            id="description"
            name="description"
            rows="5"
            required></textarea>


        <label for="dueDate">Due Date</label>

        <input
            type="date"
            id="dueDate"
            name="dueDate"
            required>


        <label for="maxMarks">Maximum Marks</label>

        <input
            type="number"
            id="maxMarks"
            name="maxMarks"
            min="1"
            placeholder="100"
            required>


        <label for="assignmentType">Assignment Type</label>

        <select
            id="assignmentType"
            name="assignmentType"
            required>

            <option value="Homework">Homework</option>
            <option value="Lab">Lab</option>
            <option value="Project">Project</option>
            <option value="Quiz">Quiz</option>

        </select>


        <label for="status">Status</label>

        <select
            id="status"
            name="status"
            required>

            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>

        </select>


        <button type="submit">
            Save Assignment
        </button>

    </form>

    <a href="adminDashboard.jsp" class="back">
        ← Back to Admin Dashboard
    </a>

</div>

</body>
</html>
