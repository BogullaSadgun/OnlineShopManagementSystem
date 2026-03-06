<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Login</title>

<style>

body{
    margin:0;
    padding:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#141e30,#243b55);
    font-family:Arial, Helvetica, sans-serif;
}

body > div{
    background:white;
    padding:40px;
    width:340px;
    border-radius:12px;
    box-shadow:0 12px 30px rgba(0,0,0,0.35);
    text-align:center;
}

h2{
    margin-bottom:25px;
    color:#333;
}

form input{
    width:90%;
    padding:10px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:14px;
    transition:0.3s;
}

form input:focus{
    outline:none;
    border-color:#243b55;
    box-shadow:0 0 6px rgba(36,59,85,0.4);
}

form button{
    width:95%;
    padding:10px;
    margin-top:10px;
    background:#243b55;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:15px;
    transition:0.3s;
}

form button:hover{
    background:#141e30;
}

p{
    margin-top:18px;
    font-size:14px;
}

body > div > div:last-child{
    margin-top:25px;
}

body > div > div:last-child button{
    width:150px;
    padding:8px;
    margin:6px;
    border:none;
    border-radius:6px;
    background:#444;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

body > div > div:last-child button:hover{
    background:black;
}

a{
    text-decoration:none;
}

</style>

</head>
<body>

<div>
<h2>seller login</h2>

<div>
<form action="Slogin" method="post">
<input type="email" name="email" placeholder="Email">
<input type="password" name="password" placeholder="passwrod">
<button>submit</button>
</form>

<%
String message = (String) request.getAttribute("msg");
if(message != null){
%>
<p style="color:red;"><%= message %></p>
<%
}
%>

</div>

<div>
<a href="UserLoginPage.jsp"> <button>user login</button> </a><br>
<a href="SellerSignup.jsp"> <button>Seller signup</button> </a>
</div>

</div>

</body>
</html>