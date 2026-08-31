<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.CourseMaterial"%>

<%
List<CourseMaterial> materials =
(List<CourseMaterial>)request.getAttribute("materials");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Learning Materials</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{

background:#f4f7fb;

}

.header{

background:#1e88e5;
color:white;
padding:20px;
font-size:28px;
font-weight:bold;
text-align:center;
box-shadow:0 3px 10px rgba(0,0,0,.2);

}

.container{

width:90%;
max-width:1200px;
margin:40px auto;

}

.cards{

display:grid;
grid-template-columns:repeat(auto-fit,minmax(330px,1fr));
gap:25px;

}

.card{

background:white;
border-radius:15px;
padding:25px;
box-shadow:0 8px 25px rgba(0,0,0,.1);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.title{

font-size:22px;
font-weight:bold;
margin-bottom:20px;
color:#333;

}

.file{

margin-bottom:20px;
color:#555;
font-size:15px;

}

.file i{

color:#d32f2f;
font-size:22px;
margin-right:8px;

}

.buttons{

display:flex;
flex-wrap:wrap;
gap:12px;

}

.btn{

padding:12px 18px;
border-radius:8px;
text-decoration:none;
color:white;
font-weight:bold;
transition:.3s;
display:inline-flex;
align-items:center;
gap:8px;

}

.pdf{

background:#1976d2;

}

.pdf:hover{

background:#0d47a1;

}

.video{

background:#43a047;

}

.video:hover{

background:#2e7d32;

}

.disabled{

background:#999;

cursor:not-allowed;

}

.back{

display:inline-block;
margin-top:40px;
background:#424242;
padding:12px 30px;
color:white;
text-decoration:none;
border-radius:8px;

}

.back:hover{

background:black;

}

.empty{

text-align:center;
font-size:22px;
color:#777;
padding:60px;

}

</style>

</head>

<body>

<div class="header">

<i class="fa-solid fa-book-open"></i>

Learning Materials

</div>

<div class="container">

<%

if(materials!=null && !materials.isEmpty()){

%>

<div class="cards">

<%

for(CourseMaterial m:materials){

%>

<div class="card">

<div class="title">

<%=m.getTitle()%>

</div>

<div class="file">

<i class="fa-solid fa-file-pdf"></i>

<%=m.getFileName()%>

</div>

<div class="buttons">

<%

if(m.getFileName()!=null && !m.getFileName().trim().isEmpty()){

%>

<a class="btn pdf"
href="uploads/<%=m.getFileName()%>"
download>

<i class="fa-solid fa-download"></i>

Download PDF

</a>

<%

}

if(m.getVideoLink()!=null &&
!m.getVideoLink().trim().isEmpty()){

%>

<a class="btn video"
href="<%=m.getVideoLink()%>"
target="_blank">

<i class="fa-solid fa-circle-play"></i>

Watch Video

</a>

<%

}else{

%>

<span class="btn disabled">

<i class="fa-solid fa-ban"></i>

No Video

</span>

<%

}

%>

</div>

</div>

<%

}

%>

</div>

<%

}else{

%>

<div class="empty">

<i class="fa-solid fa-folder-open"></i>

<br><br>

No Learning Materials Available

</div>

<%

}

%>

<center>

<a href="myCourses" class="back">

<i class="fa-solid fa-arrow-left"></i>

Back to Courses

</a>

</center>

</div>

</body>
</html>