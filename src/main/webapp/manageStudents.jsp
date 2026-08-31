<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Students</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    margin: 0;
}

.container {
    width: 90%;
    margin: 40px auto;
    background: white;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.15);
}

h2 {
    text-align: center;
    color: #2E7D32;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 25px;
}

th {
    background: #2E7D32;
    color: white;
    padding: 12px;
}

td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

tr:nth-child(even) {
    background: #f8f8f8;
}

.back {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background: #2E7D32;
    color: white;
    text-decoration: none;
    border-radius: 6px;
}
</style>

</head>

<body>

<div class="container">

    <h2>Manage Students</h2>

    <table>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
        </tr>

        <tr>
            <td>1</td>
            <td>Sample Student</td>
            <td>student@example.com</td>
        </tr>

    </table>

    <a href="adminDashboard.jsp" class="back">
        Back to Dashboard
    </a>

</div>

</body>
</html>