
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.lms.dao.CourseDAO"%>

<%
    // Student login check
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    CourseDAO courseDAO = new CourseDAO();
    int totalCourses = courseDAO.getCourseCount();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Student Dashboard</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

    <%@ include file="includes/navbar.jsp" %>

    <%@ include file="includes/sidebar.jsp" %>


    <div class="content">

        <!-- Welcome Banner -->

        <div class="dashboard-banner">

            <img src="${pageContext.request.contextPath}/images/dashboard-banner.jpg"
                 alt="Learning">

            <div class="banner-overlay">

                <h1>
                    Welcome,
                    <%= session.getAttribute("studentName") %>
                </h1>

                <p>
                    Learn • Practice • Achieve Your Goals
                </p>

                <a href="${pageContext.request.contextPath}/viewCourses"
                   class="banner-btn">

                    Explore Courses

                </a>

            </div>

        </div>


        <!-- Statistics -->

        <div class="dashboard-stats">

            <div class="stat-card">

                <i class="fas fa-book"></i>

                <h2>
                    <%= totalCourses %>
                </h2>

                <p>
                    Available Courses
                </p>

            </div>


            <div class="stat-card">

                <i class="fas fa-video"></i>

                <h2>15</h2>

                <p>
                    Course Videos
                </p>

            </div>


            <div class="stat-card">

                <i class="fas fa-question-circle"></i>

                <h2>10</h2>

                <p>
                    Quizzes
                </p>

            </div>


            <div class="stat-card">

                <i class="fas fa-award"></i>

                <h2>5</h2>

                <p>
                    Certificates
                </p>

            </div>

        </div>


        <!-- Continue Learning -->

        <h2 class="section-title">
            Continue Learning
        </h2>

        <div class="continue-card">

            <img src="${pageContext.request.contextPath}/images/course.jpg"
                 alt="Java Course">

            <div>

                <h3>
                    Java Programming
                </h3>

                <p>
                    Progress: 65%
                </p>

                <div class="progress">

                    <div class="progress-fill"></div>

                </div>

                <a href="${pageContext.request.contextPath}/viewVideos"
                   class="banner-btn">

                    Continue Learning

                </a>

            </div>

        </div>


        <!-- Quick Access -->

        <h2 class="section-title">
            Quick Access
        </h2>


        <div class="quick-grid">


            <a href="${pageContext.request.contextPath}/viewCourses">

                <i class="fas fa-book-open"></i>

                Courses

            </a>


            <a href="${pageContext.request.contextPath}/myCourses">

                <i class="fas fa-graduation-cap"></i>

                My Courses

            </a>


            <a href="${pageContext.request.contextPath}/viewVideos">

                <i class="fas fa-video"></i>

                Videos

            </a>


            <a href="${pageContext.request.contextPath}/viewAssignments">

                <i class="fas fa-file-alt"></i>

                Assignments

            </a>


            <a href="${pageContext.request.contextPath}/takeQuiz">

                <i class="fas fa-question-circle"></i>

                Quiz

            </a>


            <a href="${pageContext.request.contextPath}/studentProfile">

                <i class="fas fa-user"></i>

                Profile

            </a>


            <a href="${pageContext.request.contextPath}/viewCertificates">

                <i class="fas fa-award"></i>

                Certificates

            </a>


            <a href="${pageContext.request.contextPath}/studentAnnouncements">

                <i class="fas fa-bullhorn"></i>

                Announcements

            </a>


            <a href="${pageContext.request.contextPath}/studentLiveClasses">

                <i class="fas fa-video"></i>

                Live Classes

            </a>


            <a href="${pageContext.request.contextPath}/studentDiscussion">

                <i class="fas fa-comments"></i>

                Discussion Forum

            </a>


            <a href="${pageContext.request.contextPath}/logout">

                <i class="fas fa-sign-out-alt"></i>

                Logout

            </a>


        </div>

    </div>

</body>

</html>
