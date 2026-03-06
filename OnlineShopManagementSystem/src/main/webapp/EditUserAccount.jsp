<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Account</title>

<style>

body{
    font-family: Arial, Helvetica, sans-serif;
    background-color:#f2f4f8;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    margin:0;
}

.container{
    background:white;
    padding:25px 30px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.15);
    width:320px;
}

h2{
    text-align:center;
    margin-bottom:20px;
    color:#333;
}

label{
    font-weight:bold;
    font-size:14px;
    color:#444;
}

input{
    width:100%;
    padding:8px;
    margin-top:5px;
    margin-bottom:12px;
    border:1px solid #ccc;
    border-radius:5px;
    font-size:14px;
}

input:focus{
    border-color:#4CAF50;
    outline:none;
}

button{
    width:100%;
    padding:10px;
    border:none;
    border-radius:6px;
    background-color:#4CAF50;
    color:white;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background-color:#43a047;
}

</style>

</head>
<body>

<div class="container">

<h2>Edit Account</h2>

<form action="UpdateUAccount" method="post">

<label>Name</label>
<input type="text" name="name">

<label>Email</label>
<input type="email" name="email">

<label>Password</label>
<input type="password" name="password">

<button type="submit">Update</button>

</form>

</div>

</body>
</html>