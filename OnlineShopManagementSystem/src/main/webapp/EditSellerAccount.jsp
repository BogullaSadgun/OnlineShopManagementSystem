<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Seller Account</title>

<style>

body{
	margin:0;
	font-family:Arial, Helvetica, sans-serif;
	background:linear-gradient(120deg,#667eea,#764ba2);
	height:100vh;
	display:flex;
	align-items:center;
	justify-content:center;
}

.box{
	background:white;
	padding:35px;
	width:360px;
	border-radius:10px;
	box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
	text-align:center;
	margin-bottom:25px;
}

label{
	font-weight:bold;
	font-size:14px;
}

input{
	width:100%;
	padding:10px;
	margin-top:6px;
	margin-bottom:18px;
	border:1px solid #ccc;
	border-radius:6px;
}

input:focus{
	outline:none;
	border-color:#667eea;
	box-shadow:0 0 5px rgba(102,126,234,0.4);
}

button{
	width:100%;
	padding:11px;
	border:none;
	background:#667eea;
	color:white;
	font-size:15px;
	border-radius:6px;
	cursor:pointer;
	transition:0.3s;
}

button:hover{
	background:#4d63d6;
	transform:scale(1.03);
}

</style>
</head>

<body>

<div class="box">

<h2>Edit Seller Account</h2>

<form action="UpdateSellerAccount" method="post">

<label>Name</label>
<input type="text" name="name" required>

<label>Email</label>
<input type="email" name="email" required>

<label>Password</label>
<input type="password" name="password" required>

<button type="submit">Update Account</button>

</form>

</div>

</body>
</html>