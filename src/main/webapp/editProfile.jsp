<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

<style>

body {
    background: #f5f7fa;
    font-family: "Segoe UI", sans-serif;
}

.edit-container {
    width: 600px;
    margin: 40px auto;
    background: white;
    padding: 35px;
    border-radius: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,.12);
}

.edit-container h1 {
    color: #2E7D32;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
    color: #333;
}

.form-group input {
    width: 100%;
    box-sizing: border-box;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 16px;
}

.save-btn {
    background: #2E7D32;
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    margin-top: 10px;
}

.save-btn:hover {
    background: #1B5E20;
}

</style>

</head>


<body>

<%@ include file="includes/navbar.jsp"%>

<%@ include file="includes/sidebar.jsp"%>


<div class="content">

    <div class="edit-container">

        <h1>
            <i class="fas fa-user-edit"></i>
            Edit Profile
        </h1>


        <form action="updateProfile"
              method="post"
              enctype="multipart/form-data">


            <!-- PROFILE PICTURE - ONLY ONCE -->

            <div class="form-group">

                <label>Profile Picture</label>

                <input type="file"
                       name="profilePicture"
                       accept="image/*">

            </div>


            <!-- NAME -->

            <div class="form-group">

                <label>Name</label>

                <input type="text"
                       name="name"
                       value="kaviya"
                       required>

            </div>


            <!-- EMAIL -->

            <div class="form-group">

                <label>Email</label>

                <input type="email"
                       name="email"
                       value="kanishkraj12@gmail.com"
                       required>

            </div>


            <!-- PASSWORD -->

            <div class="form-group">

                <label>Password</label>

                <input type="password"
                       name="password"
                       placeholder="Enter new password">

            </div>


            <!-- SAVE -->

            <button type="submit"
                    class="save-btn">

                <i class="fas fa-save"></i>
                Save Changes

            </button>


        </form>

    </div>

</div>

</body>

</html>