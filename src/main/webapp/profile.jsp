<%@ page import="com.lms.model.Student" %>

<%
Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
</head>
<body>

<h2>My Profile</h2>

<form action="updateProfile" method="post">

<input type="hidden" name="id" value="<%= student.getId() %>">

Name:<br>
<input type="text" name="name"
value="<%= student.getName() %>"><br><br>

Email:<br>
<input type="email" name="email"
value="<%= student.getEmail() %>"><br><br>

Password:<br>
<input type="password" name="password"
value="<%= student.getPassword() %>"><br><br>

<input type="submit" value="Update Profile">

</form>

<br>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>