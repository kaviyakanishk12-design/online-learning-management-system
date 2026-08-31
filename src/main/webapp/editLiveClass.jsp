<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.lms.model.LiveClass" %>

<%
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    LiveClass live = (LiveClass) request.getAttribute("live");

    if (live == null) {
        response.sendRedirect("viewLiveClasses");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Live Class - LMS Admin</title>

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}

.container {
    width: 90%;
    max-width: 700px;
    margin: 40px auto;
}

.card {
    background: white;
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

h1 {
    color: #2E7D32;
    margin-bottom: 25px;
}

label {
    display: block;
    margin-top: 15px;
    margin-bottom: 6px;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 7px;
    box-sizing: border-box;
}

button {
    margin-top: 25px;
    padding: 12px 22px;
    border: none;
    border-radius: 7px;
    background: #2E7D32;
    color: white;
    cursor: pointer;
    font-size: 15px;
}

.back {
    display: inline-block;
    margin-left: 10px;
    padding: 12px 22px;
    background: #64748b;
    color: white;
    text-decoration: none;
    border-radius: 7px;
}

</style>

</head>

<body>

<div class="container">

<div class="card">

<h1>Edit Live Class</h1>

<form action="editLiveClass" method="post">

<input type="hidden"
       name="id"
       value="<%= live.getId() %>">

<label>Course ID</label>

<input type="number"
       name="courseId"
       value="<%= live.getCourseId() %>"
       required>

<label>Class Title</label>

<input type="text"
       name="classTitle"
       value="<%= live.getClassTitle() %>"
       required>

<label>Instructor</label>

<input type="text"
       name="instructor"
       value="<%= live.getInstructor() %>"
       required>

<label>Date</label>

<input type="date"
       name="classDate"
       value="<%= live.getClassDate() %>"
       required>

<label>Time</label>

<input type="time"
       name="classTime"
       value="<%= live.getClassTime() %>"
       required>

<label>Google Meet Link</label>

<input type="text"
       name="meetLink"
       value="<%= live.getMeetLink() %>">

<button type="submit">
    Update Live Class
</button>

<a href="viewLiveClasses" class="back">
    Cancel
</a>

</form>

</div>

</div>

</body>
</html>