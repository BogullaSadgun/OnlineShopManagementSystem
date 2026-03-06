<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>

<head>

	<title>Seller Home</title>

	<style>
body{
	margin:0;
	font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
	min-height:100vh;
	color:#333;
}

.navbar{
	display:flex;
	justify-content:space-between;
	align-items:center;
	padding:18px 40px;
	background:rgba(0,0,0,0.6);
	backdrop-filter:blur(10px);
	color:white;
	box-shadow:0 6px 25px rgba(0,0,0,0.4);
}

.navbar h2{
	margin:0;
	letter-spacing:1px;
	font-weight:600;
}

.navbar a{
	color:#00f2ff;
	text-decoration:none;
	font-weight:600;
	transition:0.3s;
}

.navbar a:hover{
	color:white;
	text-shadow:0 0 8px #00f2ff;
}
.container{
	display:flex;
}
.category{
	width:20%;
	background:rgba(0,0,0,0.75);
	color:white;
	padding:30px;
	min-height:100vh;
	box-shadow:5px 0 20px rgba(0,0,0,0.5);
}

.category h3{
	margin-bottom:30px;
	border-bottom:1px solid rgba(255,255,255,0.2);
	padding-bottom:10px;
	font-weight:500;
}

.category a{
	display:block;
	margin:18px 0;
	color:#00eaff;
	text-decoration:none;
	font-size:15px;
	transition:0.3s;
}

.category a:hover{
	color:white;
	padding-left:8px;
}
.products{
	width:80%;
	padding:40px;
	display:flex;
	flex-wrap:wrap;
	gap:30px;
	justify-content:flex-start;
}
.card{
	width:230px;
	padding:20px;
	background:white;
	border-radius:14px;
	box-shadow:0 12px 30px rgba(0,0,0,0.25);
	transition:0.3s;
	position:relative;
	overflow:hidden;
}

.card:hover{
	transform:translateY(-10px) scale(1.03);
	box-shadow:0 18px 45px rgba(0,0,0,0.35);
}

.card h3{
	margin-top:0;
	color:#222;
}

.card button{
	width:100%;
	padding:8px;
	margin-top:6px;
	border:none;
	border-radius:6px;
	font-weight:600;
	cursor:pointer;
	transition:0.3s;
}

.card button[type="submit"]{
	background:#111;
	color:white;
}

.card button[type="submit"]:hover{
	background:#ff3c3c;
}

form[action="UpdateProduct.jsp"] button{
	background:#007bff;
	color:white;
}

form[action="UpdateProduct.jsp"] button:hover{
	background:#00b7ff;
}

#sidebar{
	position:fixed;
	top:0;
	left:-320px;
	width:260px;
	height:100vh;
	background:linear-gradient(180deg,#000,#1f1f1f);
	color:white;
	padding:25px;
	transition:0.4s;
	z-index:100;
	box-shadow:8px 0 30px rgba(0,0,0,0.7);
}

#sidebar h3{
	border-bottom:1px solid #444;
	padding-bottom:10px;
	margin-bottom:25px;
}

#sidebar a{
	color:#00eaff;
	text-decoration:none;
	display:block;
	margin:18px 0;
	font-weight:500;
	transition:0.3s;
}

#sidebar a:hover{
	color:white;
	padding-left:8px;
}

.menuButton{
	position:fixed;
	top:18px;
	left:18px;
	width:48px;
	height:48px;
	border-radius:50%;
	background:linear-gradient(135deg,#00eaff,#0072ff);
	color:white;
	border:none;
	font-size:22px;
	cursor:pointer;
	z-index:200;
	box-shadow:0 6px 20px rgba(0,0,0,0.5);
	transition:0.3s;
}

.menuButton:hover{
	transform:rotate(90deg) scale(1.1);
}

	</style>

	<script>

		function openMenu(){
			document.getElementById("sidebar").style.left="0";
		}

		function closeMenu(){
			document.getElementById("sidebar").style.left="-350px";
		}

	</script>

</head>

<body>

	<button class="menuButton" onclick="openMenu()">S</button>


	<div id="sidebar">

		<h3>Seller Options</h3>

		<a href="AddProduct.jsp">Add Product</a>

		<a href="EditSellerAccount.jsp">Edit Account</a>

		<a href="SellerHome.jsp">All Products</a>

		<br><br>

		<button onclick="closeMenu()">Close</button>

	</div>



	<div class="navbar">

		<h2>Seller Dashboard</h2>

		<div>
			<a href="Logout">Logout</a>
		</div>

	</div>



	<div class="container">

		<div class="category">

			<h3>Seller Options</h3>

			<a href="AddProduct.jsp">Add Product</a><br><br>

			<a href="EditSellerAccount.jsp">Edit Account</a><br><br>

			<a href="SellerHome.jsp">All Products</a>

		</div>



		<div class="products">

<%

	HttpSession session1 = request.getSession();

	int sellerId = (int) session1.getAttribute("sellerId");

	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop","root","root");

	PreparedStatement ps = con.prepareStatement("select * from products where SellerId=?");

	ps.setInt(1,sellerId);

	ResultSet rs = ps.executeQuery();

	while(rs.next()){

%>


			<div class="card">

				<h3><%= rs.getString("ProductName") %></h3>

				Category: <%= rs.getString("Category") %> <br>

				Price: ₹<%= rs.getDouble("Price") %> <br><br>


				<form action="DeleteProduct" method="post">

					<input type="hidden" name="id" value="<%= rs.getInt("Id") %>">

					<button type="submit">Delete</button>

				</form>

				<br>


				<form action="UpdateProduct.jsp" method="get">

					<input type="hidden" name="id" value="<%= rs.getInt("Id") %>">

					<button type="submit">Update</button>

				</form>

			</div>


<%

	}

	con.close();

%>


		</div>

	</div>

</body>

</html>








