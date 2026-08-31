<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Course" %>

<%
List<Course> courses = (List<Course>) request.getAttribute("courses");

if(courses == null){
    out.println("Courses is NULL");
    return;
}

out.println("Total Courses: " + courses.size());
%>
%><form action="uploadMaterial"
      method="post"
      enctype="multipart/form-data">

Course

<select name="courseId">

<%
for(Course c : courses){
%>

<option value="<%=c.getId()%>">
<%=c.getCourseName()%>
</option>

<%
}
%>

</select>

<br><br>

Title

<input type="text" name="title" required>

<br><br>

Choose File

<input type="file" name="file" required>

<br><br>

Video Link

<input type="text"
       name="videoLink"
       placeholder="https://www.youtube.com/watch?v=xxxx">

<br><br>

<input type="submit" value="Upload Material">

</form>