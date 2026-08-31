<div class="navbar">

    <div class="logo">

        LMS Portal

    </div>
<div class="user">

<%
if(session.getAttribute("admin") != null){
%>

Welcome, <%= session.getAttribute("admin") %>

<%
}else if(session.getAttribute("studentName") != null){
%>

Welcome, <%= session.getAttribute("studentName") %>

<%
}else{
%>

Welcome, Guest

<%
}
%>

</div>
</div>