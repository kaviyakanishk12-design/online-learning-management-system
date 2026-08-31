<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.model.Announcement"%>

<%
    // Redirect if admin not logged in
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    // Announcements list passed from servlet
    List<Announcement> announcements =
        (List<Announcement>) request.getAttribute("announcements");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Announcements - LMS Admin</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        /* GLOBAL */
        * { margin:0; padding:0; box-sizing:border-box; font-family:"Segoe UI", Arial, sans-serif; }
        body { background:#f4f6f9; min-height:100vh; }

        /* HEADER */
        .header { height:75px; background:white; display:flex; align-items:center;
                  justify-content:space-between; padding:0 40px; box-shadow:0 3px 12px rgba(0,0,0,0.08); }
        .logo { color:#2E7D32; font-size:24px; font-weight:bold; }
        .logo i { margin-right:10px; }
        .nav { display:flex; gap:22px; }
        .nav a { color:#444; text-decoration:none; font-weight:600; font-size:14px; }
        .nav a:hover { color:#2E7D32; }

        /* CONTAINER */
        .container { width:90%; max-width:1100px; margin:40px auto; }

        /* PAGE HEADER */
        .page-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:30px; }
        .page-header h1 { font-size:32px; color:#222; }
        .page-header h1 i { color:#2E7D32; margin-right:10px; }
        .page-header p { color:#777; margin-top:7px; }

        /* ADD BUTTON */
        .add-btn { background:#2E7D32; color:white; text-decoration:none; padding:12px 18px;
                   border-radius:8px; font-weight:600; }
        .add-btn:hover { background:#1B5E20; }

        /* ANNOUNCEMENT CARD */
        .announcement-card { background:white; padding:25px; margin-bottom:20px;
                             border-radius:14px; box-shadow:0 5px 16px rgba(0,0,0,0.08);
                             border-left:5px solid #2E7D32; }
        .announcement-card h2 { color:#222; margin-bottom:12px; }
        .message { color:#555; font-size:16px; line-height:1.6; margin-bottom:15px; }
        .date { color:#888; font-size:13px; }

        /* ACTIONS */
        .actions { margin-top:18px; }
        .delete-btn { display:inline-flex; align-items:center; gap:7px; background:#dc3545;
                      color:white; text-decoration:none; padding:10px 16px; border-radius:7px;
                      font-weight:600; }
        .delete-btn:hover { background:#b02a37; }

        /* EMPTY */
        .empty { background:white; text-align:center; padding:50px; border-radius:14px;
                 box-shadow:0 5px 16px rgba(0,0,0,0.08); }
        .empty i { font-size:45px; color:#2E7D32; margin-bottom:15px; }
        .empty h2 { margin-bottom:8px; }
        .empty p { color:#777; }

        /* BACK */
        .back { display:inline-block; margin-top:25px; background:#64748b; color:white;
                text-decoration:none; padding:11px 18px; border-radius:7px; }
        .back:hover { background:#475569; }

        /* RESPONSIVE */
        @media(max-width:700px) {
            .header { height:auto; padding:20px; flex-direction:column; gap:15px; }
            .nav { flex-wrap:wrap; justify-content:center; }
            .page-header { flex-direction:column; align-items:flex-start; gap:20px; }
        }
    </style>
</head>

<body>

<!-- ADMIN HEADER -->
<div class="header">
    <div class="logo">
        <i class="fas fa-graduation-cap"></i>
        LMS Admin Portal
    </div>
    <div class="nav">
        <a href="adminDashboard"><i class="fas fa-home"></i> Dashboard</a>
        <a href="adminCourses"><i class="fas fa-book"></i> Courses</a>
        <a href="viewLiveClasses"><i class="fas fa-video"></i> Live Classes</a>
        <a href="viewAssignments"><i class="fas fa-file-alt"></i> Assignments</a>
        <a href="viewAnnouncements"><i class="fas fa-bullhorn"></i> Announcements</a>
        <a href="adminLogout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</div>

<!-- MAIN -->
<div class="container">
    <div class="page-header">
        <div>
            <h1><i class="fas fa-bullhorn"></i> Manage Announcements</h1>
            <p>Create and manage announcements for students</p>
        </div>
        <a href="addAnnouncement.jsp" class="add-btn">
            <i class="fas fa-plus"></i> Create Announcement
        </a>
    </div>

<%
    if (announcements != null && !announcements.isEmpty()) {
        for (Announcement a : announcements) {
%>
    <div class="announcement-card">
        <h2><i class="fas fa-bullhorn"></i> <%= a.getTitle() %></h2>
        <div class="message"><%= a.getMessage() %></div>
        <div class="date"><i class="fas fa-calendar"></i> Posted On : <%= a.getPostedDate() %></div>
        <div class="actions">
            <a href="deleteAnnouncement?id=<%= a.getId() %>"
               class="delete-btn"
               onclick="return confirm('Are you sure you want to delete this announcement?');">
                <i class="fas fa-trash"></i> Delete
            </a>
        </div>
    </div>
<%
        }
    } else {
%>
    <div class="empty">
        <i class="fas fa-bullhorn"></i>
        <h2>No Announcements</h2>
        <p>No announcements have been created yet.</p>
    </div>
<%
    }
%>

    <a href="adminDashboard" class="back">
        <i class="fas fa-arrow-left"></i> Back to Admin Dashboard
    </a>
</div>

</body>
</html>
