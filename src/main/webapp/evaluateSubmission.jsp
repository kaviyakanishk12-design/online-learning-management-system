<%
String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Evaluate Assignment</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI;
}

body{
background:#f4f6f9;
}

.container{

width:500px;
margin:50px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.2);

}

h2{

text-align:center;
color:#2E7D32;
margin-bottom:25px;

}

label{

display:block;
margin-top:15px;
font-weight:bold;

}

input[type=number]{

width:100%;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:6px;

}

textarea{

width:100%;
height:120px;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:6px;
resize:none;

}

button{

width:100%;
padding:14px;
margin-top:25px;
background:#2E7D32;
color:white;
font-size:17px;
border:none;
border-radius:8px;
cursor:pointer;

}

button:hover{

background:#1B5E20;

}

</style>

</head>

<body>

<div class="container">

<h2>Evaluate Assignment</h2>

<form action="evaluateSubmission" method="post">

<input
type="hidden"
name="id"
value="<%=id%>">

<label>

Marks (Out of 100)

</label>

<input
type="number"
name="marks"
min="0"
max="100"
required>

<label>

Feedback

</label>

<textarea
name="feedback"
required></textarea>

<button type="submit">

Save Evaluation

</button>

</form>

</div>

</body>
</html>