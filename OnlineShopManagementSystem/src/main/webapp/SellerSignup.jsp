<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<title>Seller Signup</title>

	<style>

		body{
			margin:0;
			padding:0;
			height:100vh;
			display:flex;
			justify-content:center;
			align-items:center;
			background:linear-gradient(135deg,#1f1c2c,#928dab);
			font-family:Arial, Helvetica, sans-serif;
		}

		body > div{
			background:white;
			padding:40px;
			width:360px;
			border-radius:12px;
			box-shadow:0 12px 30px rgba(0,0,0,0.35);
			text-align:center;
		}

		h2{
			margin-bottom:25px;
			color:#333;
		}

		form{
			margin-top:10px;
		}

		form input{
			width:90%;
			padding:10px;
			margin:8px 0;
			border:1px solid #ccc;
			border-radius:6px;
			font-size:14px;
			transition:0.3s;
		}

		form input:focus{
			outline:none;
			border-color:#5a4fcf;
			box-shadow:0 0 6px rgba(90,79,207,0.5);
		}

		form button{
			width:95%;
			padding:10px;
			margin-top:12px;
			background:#5a4fcf;
			color:white;
			border:none;
			border-radius:6px;
			cursor:pointer;
			font-size:15px;
			transition:0.3s;
		}

		form button:hover{
			background:#3e36a8;
		}

		p{
			margin-top:20px;
			font-size:14px;
		}

		a button{
			margin-top:20px;
			width:160px;
			padding:9px;
			border:none;
			border-radius:6px;
			background:#444;
			color:white;
			cursor:pointer;
			transition:0.3s;
		}

		a button:hover{
			background:black;
		}

	</style>

</head>

<body>

	<div>

		<h2>seller signup page</h2>

		<form action="SSignup" method="post">

			<input type="email" name="email" placeholder="Email">

			<input type="password" name="password" placeholder="Passwrod">

			<input type="text" name="name" placeholder="Name">

			<input type="number" name="mobileNumber" placeholder="Moblie Number">

			<input type="text" name="ShopName" placeholder="Shop Name">

			<input type="text" name="address" placeholder="Address">

			<button>submit</button>

		</form>


		<%

			String msg = (String)request.getAttribute("msg");

			if(msg != null){

		%>

				<p style="color:red;"><%= msg %></p>

		<%

			}

		%>


		<a href="SellerLogin.jsp">

			<button>seller login</button>

		</a>

	</div>

</body>

</html>









