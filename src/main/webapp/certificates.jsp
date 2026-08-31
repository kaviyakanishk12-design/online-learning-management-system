
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Certificate"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>My Certificates - LMS Portal</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet"
          href="css/style.css">

    <style>

        body {
            background: #f4f6f9;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        .certificate-container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .page-header {
            background: linear-gradient(135deg, #1B5E20, #43A047);
            color: white;
            padding: 35px;
            border-radius: 18px;
            margin-bottom: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .page-header h1 {
            margin: 0 0 10px;
            font-size: 34px;
        }

        .page-header p {
            margin: 0;
            font-size: 17px;
        }

        .certificate-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }

        .certificate-card {
            background: white;
            padding: 30px;
            border-radius: 18px;
            border-top: 5px solid #2E7D32;
            box-shadow: 0 8px 20px rgba(0,0,0,0.10);
            text-align: center;
            transition: 0.3s;
        }

        .certificate-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }

        .certificate-icon {
            width: 75px;
            height: 75px;
            margin: 0 auto 20px;

            border-radius: 50%;

            background: #e8f5e9;

            display: flex;
            justify-content: center;
            align-items: center;

            color: #2E7D32;

            font-size: 35px;
        }

        .certificate-card h2 {
            color: #222;
            margin-bottom: 15px;
        }

        .status {
            display: inline-block;
            padding: 7px 16px;
            border-radius: 20px;
            background: #e8f5e9;
            color: #2E7D32;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .download-btn {
            display: block;
            width: 100%;
            padding: 13px;

            background: #2E7D32;
            color: white;

            text-decoration: none;

            border-radius: 8px;

            font-weight: bold;
            font-size: 16px;

            transition: 0.3s;
        }

        .download-btn:hover {
            background: #1B5E20;
        }

        .empty {
            background: white;
            padding: 60px 30px;
            border-radius: 18px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.10);
        }

        .empty i {
            font-size: 60px;
            color: #aaa;
            margin-bottom: 20px;
        }

        .empty h2 {
            color: #333;
        }

        .empty p {
            color: #777;
        }

    </style>

</head>

<body>

<%@ include file="includes/navbar.jsp"%>

<%@ include file="includes/sidebar.jsp"%>

<div class="content">

    <div class="certificate-container">

        <!-- HEADER -->

        <div class="page-header">

            <h1>
                <i class="fas fa-award"></i>
                My Certificates
            </h1>

            <p>
                View and download certificates for your completed courses.
            </p>

        </div>


        <!-- CERTIFICATES -->

        <div class="certificate-grid">

            <%

                List<Certificate> certificates =
                    (List<Certificate>) request.getAttribute("certificates");

                if (certificates != null && !certificates.isEmpty()) {

                    for (Certificate certificate : certificates) {

            %>

                <div class="certificate-card">

                    <div class="certificate-icon">

                        <i class="fas fa-certificate"></i>

                    </div>

                    <h2>
                        <%= certificate.getCourseName() %>
                    </h2>

                    <div class="status">

                        <i class="fas fa-check-circle"></i>

                        <%= certificate.getStatus() %>

                    </div>

                   <a href="${pageContext.request.contextPath}/downloadCertificate?id=<%= certificate.getId() %>"
   class="btn">

    <i class="fas fa-download"></i>
    Download

</a>

                </div>

            <%

                    }

                } else {

            %>

                <div class="empty">

                    <i class="fas fa-award"></i>

                    <h2>
                        No Certificates Available
                    </h2>

                    <p>
                        You have not completed any courses yet.
                    </p>

                </div>

            <%

                }

            %>

        </div>

    </div>

</div>

</body>

</html>
