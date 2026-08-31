<%@ page contentType="text/html;charset=UTF-8" %>

<%
String assignmentId = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Assignment</title>
</head>

<body>

<h2>Submit Assignment</h2>

<form action="submitAssignment"
      method="post"
      enctype="multipart/form-data">

<input type="hidden"
       name="assignmentId"
       value="<%=assignmentId%>">

<input type="file"
       name="file"
       required>

<br><br>

<input type="submit"
       value="Submit Assignment">

</form>

</body>
</html>