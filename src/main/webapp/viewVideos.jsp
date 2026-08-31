<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Video"%>

<%
List<Video> videoList =
(List<Video>)request.getAttribute("videos");
%>
<%
if(videoList == null){
    out.println("<h2>Video list is NULL</h2>");
}
else if(videoList.isEmpty()){
    out.println("<h2>No videos found</h2>");
}
else{
    out.println("<h2>Videos found: " + videoList.size() + "</h2>");
}
%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Course Videos</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

<style>

body{
    background:#f5f7fa;
    font-family:Segoe UI,sans-serif;
}

.container{
    width:95%;
    margin:30px auto;
}

.title{
    font-size:40px;
    color:#2E7D32;
    margin-bottom:25px;
}

.video-grid{

display:grid;

grid-template-columns:repeat(auto-fit,minmax(420px,1fr));

gap:30px;

}

.video-card{

background:white;

border-radius:15px;

overflow:hidden;

box-shadow:0 8px 20px rgba(0,0,0,.15);

transition:.3s;

}

.video-card:hover{

transform:translateY(-8px);

}

.video-card iframe{

width:100%;

height:250px;

border:none;

}

.video-body{

padding:20px;

}

.video-body h2{

color:#2E7D32;

margin-bottom:15px;

}

.video-body p{

font-size:18px;

color:#555;

margin-bottom:20px;

}

.watch-btn{

display:block;

background:#2E7D32;

color:white;

text-align:center;

padding:12px;

text-decoration:none;

font-size:18px;

border-radius:8px;

font-weight:bold;

}

.watch-btn:hover{

background:#1B5E20;

}

</style>

</head>

<body>

<%@ include file="includes/navbar.jsp"%>

<%@ include file="includes/sidebar.jsp"%>

<div class="content">

<div class="container">

<h1 class="title">

<i class="fas fa-video"></i>

Course Videos

</h1>

<div class="video-grid">

<%
if(videoList!=null){

for(Video v:videoList){
%>

<div class="video-card">

<iframe src="<%=v.getYoutubeLink()%>"
allowfullscreen>

</iframe>

<div class="video-body">

<h2>

<%=v.getTitle()%>

</h2>

<p>

Learn this topic with an HD recorded lecture.

</p>

<a class="watch-btn"

target="_blank"

href="<%=v.getYoutubeLink()%>">

<i class="fas fa-play-circle"></i>

Watch on YouTube

</a>

</div>

</div>

<%
}
}
%>

</div>

</div>

</div>

</body>

</html>