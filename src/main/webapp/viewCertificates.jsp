<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Certificate"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Certificates</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ include file="includes/navbar.jsp"%>
<%@ include file="includes/sidebar.jsp"%>

<div class="content">
    <div class="container">
        <h1 class="title">
            <i class="fas fa-award"></i>
            Certificates
        </h1>

        <div class="certificate-grid">
            <%
                List<Certificate> certificates = (List<Certificate>) request.getAttribute("certificates");
                if (certificates != null && !certificates.isEmpty()) {
                    for (Certificate certificate : certificates) {
            %>
                <div class="card">
                    <i class="fas fa-certificate icon"></i>
                 <h2><%= certificate.getCourseName() %></h2>
                 
                    <p>Status: <%= certificate.getStatus() %></p>
                    <a href="downloadCertificate?id=<%= certificate.getId() %>" class="btn">
                        <i class="fas fa-download"></i>
                        Download
                    </a>
                </div>
            <%
                    }
                } else {
            %>
                <div class="empty">
                    <i class="fas fa-bell-slash"></i>
                    <h2>No Certificates Available</h2>
                    <p>You have not completed any courses yet.</p>
                </div>
            <%
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
