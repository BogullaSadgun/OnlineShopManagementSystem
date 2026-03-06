<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Signup</title>

<style>

body{
    margin:0;
    padding:0;
    background:linear-gradient(135deg,#1e3c72,#2a5298);
    font-family:Arial, Helvetica, sans-serif;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

#body{
    background:white;
    padding:40px;
    border-radius:12px;
    width:350px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

h1{
    margin-bottom:25px;
    color:#333;
}

form input{
    width:90%;
    padding:10px;
    margin:8px 0;
    border-radius:6px;
    border:1px solid #ccc;
    font-size:14px;
    transition:0.3s;
}

form input:focus{
    border-color:#2a5298;
    outline:none;
    box-shadow:0 0 5px rgba(42,82,152,0.5);
}

form button{
    width:95%;
    padding:10px;
    margin-top:10px;
    background:#2a5298;
    color:white;
    border:none;
    border-radius:6px;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

form button:hover{
    background:#1e3c72;
}

#buttondiv{
    margin-top:25px;
}

#buttondiv button{
    width:150px;
    padding:8px;
    margin:5px;
    border:none;
    border-radius:6px;
    background:#444;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

#buttondiv button:hover{
    background:black;
}

#buttondiv a{
    text-decoration:none;
    color:white;
}

</style>

</head>
<body>

<div id="body">
<h1>user signup Page</h1>

<form action="Usign" method="post">
<input type="email" name="email" placeholder="Email"><br>
<input type="password" name="password" placeholder="Password"><br>
<input type="text" name="name" placeholder="Name"><br>
<input name="Mnum" placeholder="Mobile Nubmer"><br>
<input type="number" name="age" placeholder="Age"><br>
<input type="text" name="address" placeholder="Address"><br>
<button>submit</button>
</form>

<div id="buttondiv">
<a href="UserSigupPage.jsp"><button>signup</button></a><br>
<button><a>seller login</a></button>
</div>

</div>

</body>
</html>