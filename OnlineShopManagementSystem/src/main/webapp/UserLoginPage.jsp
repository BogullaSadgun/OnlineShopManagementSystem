<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
    margin:0;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background:linear-gradient(120deg,#0f2027,#203a43,#2c5364);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

body > div{
    background:#f9fbfd;
    padding:45px;
    border-radius:14px;
    width:340px;
    box-shadow:0 15px 40px rgba(0,0,0,0.45);
    text-align:center;
    border:1px solid #d6e0ea;
}

h2{
    margin-bottom:30px;
    font-size:26px;
    color:#1f2a38;
    letter-spacing:1px;
}

form{
    display:flex;
    flex-direction: column;
    gap: 10px;
}

input{
    padding:12px;
    border-radius:8px;
    border:1px solid #b7c4d3;
    background:#f4f7fb;
    font-size:15px;
    color:#2a2a2a;
    transition:0.25s;
}

input:focus{
    border-color:#4a90e2;
    background:white;
    box-shadow:0 0 6px rgba(74,144,226,0.4);
    outline:none;
}

button{
    padding:11px;
    border:none;
    border-radius:8px;
    background:linear-gradient(90deg,#ff7a18,#ffb347);
    color:white;
    font-weight:bold;
    letter-spacing:0.5px;
    cursor:pointer;
    transition:0.25s;
}

button:hover{
    transform:scale(1.04);
    box-shadow:0 6px 15px rgba(0,0,0,0.25);
}

body > div > div:last-child{
    margin-top:25px;
}

body > div > div:last-child button{
    width:100%;
    margin-top:12px;
    background:linear-gradient(90deg,#5f9cff,#3a6bdc);
}

body > div > div:last-child button:hover{
    background:linear-gradient(90deg,#3a6bdc,#274db2);
}

p{
    color:#d62828;
    font-size:14px;
    font-weight:600;
    margin-top:40px;
    letter-spacing:0.4px;
}
</style>

</head>
<body>

	<div id="lbox">
	<h2>User Login</h2>
	<form action="ULogin" method="post" id="llbox">
	<input type="email" name="email" placeholder="Email">
	<input type="password" name = "password" placeholder="Password"><br>
	<button>Login</button>
	</form>
	<%
	String message = (String) request.getAttribute("msg");
	if(message != null){
	%>
	<p  id="error" style="color:red;"><%= message %></p>
	<%
	}
	%>
	<div id="buttondiv">
	<a href="UserSigupPage.jsp"><button>signup</button></a><br>
	<a href="SellerLogin.jsp"> <button>Seller signup</button> </a>
	</div>
	</div>

</body>
</html>