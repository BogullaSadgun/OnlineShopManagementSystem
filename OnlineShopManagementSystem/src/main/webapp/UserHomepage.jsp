<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

<title>User Home</title>

<style>

body{
	margin:0;
	font-family:Segoe UI, Arial;
	background:#eef2f7;
}

.navbar{
	display:flex;
	justify-content:space-between;
	align-items:center;
	padding:15px 30px;
	background:#1f2937;
	color:white;
	box-shadow:0 3px 10px rgba(0,0,0,0.2);
}

.navbar input{
	padding:7px 10px;
	border-radius:6px;
	border:none;
	outline:none;
	width:200px;
}

.navbar a{
	color:#60a5fa;
	text-decoration:none;
	font-weight:600;
}

.navbar a:hover{
	color:white;
}

.container{
	display:flex;
}

.category{
	width:20%;
	background:white;
	padding:25px;
	box-shadow:2px 0 10px rgba(0,0,0,0.08);
	min-height:100vh;
}

.category h3{
	margin-top:0;
	border-bottom:1px solid #ddd;
	padding-bottom:10px;
}

.category a{
	display:block;
	margin:12px 0;
	text-decoration:none;
	color:#374151;
	font-weight:500;
}

.category a:hover{
	color:#2563eb;
	padding-left:5px;
}

.products{
	width:80%;
	padding:30px;
	display:flex;
	flex-wrap:wrap;
	gap:20px;
}

.card{
	width:200px;
	background:white;
	padding:15px;
	border-radius:10px;
	box-shadow:0 4px 15px rgba(0,0,0,0.12);
	transition:0.25s;
}

.card:hover{
	transform:translateY(-5px);
	box-shadow:0 8px 20px rgba(0,0,0,0.18);
}

.card h4{
	margin:0 0 10px 0;
}

.card p{
	margin:4px 0;
	font-size:14px;
}

.card input{
	width:55px;
	padding:4px;
	border-radius:4px;
	border:1px solid #ccc;
}

.card button{
	margin-top:8px;
	width:100%;
	padding:7px;
	background:#2563eb;
	color:white;
	border:none;
	border-radius:6px;
	cursor:pointer;
}

.card button:hover{
	background:#1d4ed8;
}

#sidebar{
	position:fixed;
	top:0;
	left:-300px;
	width:260px;
	height:100vh;
	background:#111827;
	color:white;
	padding:25px;
	transition:0.4s;
	box-shadow:6px 0 20px rgba(0,0,0,0.4);
}

#sidebar button{
	margin-top:12px;
	padding:7px 12px;
	border:none;
	background:#3b82f6;
	color:white;
	border-radius:5px;
	cursor:pointer;
}

#sidebar button:hover{
	background:#2563eb;
}

.menuBtn{
	background:#3b82f6;
	border:none;
	padding:8px 12px;
	border-radius:6px;
	color:white;
	cursor:pointer;
}

.menuBtn:hover{
	background:#2563eb;
}

</style>

<script>
function openMenu(){
	document.getElementById("sidebar").style.left="0";
}

function closeMenu(){
	document.getElementById("sidebar").style.left="-300px";
}
</script>

</head>

<body>

<div class="navbar">

<button class="menuBtn" onclick="openMenu()">☰ Menu</button>

<div id="sidebar">

<button onclick="closeMenu()">Close</button>
<h2>Account</h2>

<form action="<%= request.getContextPath() %>/EditUserAccount.jsp" method="get">
<button type="submit">Edit Account</button>
</form>

<form action="<%= request.getContextPath() %>/PurchaseHistory.jsp" method="get">
<button type="submit">Purchase History</button>
</form>

</div>

<form action="<%= request.getContextPath() %>/UserHome" method="get">
<input type="text" name="keyword" placeholder="Search products">
</form>

<div>
<a href="Logout">Logout</a>
</div>

</div>


<div class="container">

<div class="category">

<h3>Categories</h3>

<a href="<%= request.getContextPath() %>/UserHome?cat=Electronics">Electronics</a><br>
<a href="<%= request.getContextPath() %>/UserHome?cat=Clothing">Clothing</a><br>
<a href="<%= request.getContextPath() %>/UserHome?cat=Books">Books</a><br>
<a href="<%= request.getContextPath() %>/UserHome?cat=Shoes">Shoes</a><br>
<a href="<%= request.getContextPath() %>/UserHome?cat=Accessories">Accessories</a><br>
<a href="<%= request.getContextPath() %>/UserHome?cat=Home">Home</a><br>
<a href="<%= request.getContextPath() %>/UserHome?cat=Sports">Sports</a><br>
<a href="<%= request.getContextPath() %>/UserHome">All Products</a>

</div>


<div class="products">

<%

String category = (String) request.getAttribute("cat");
String keyword = (String) request.getAttribute("keyword");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop","root","root");

PreparedStatement ps;

if(keyword != null && !keyword.isEmpty()){
	ps = con.prepareStatement("select * from products where ProductName like ?");
	ps.setString(1, "%" + keyword + "%");
}
else if(category != null){
	ps = con.prepareStatement("select * from products where Category=?");
	ps.setString(1, category);
}
else{
	ps = con.prepareStatement("select * from products");
}

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<div class="card">

<h4><%= rs.getString("ProductName") %></h4>
<p>Category: <%= rs.getString("Category") %></p>
<p>Price: ₹<%= rs.getDouble("Price") %></p>

<form action="<%= request.getContextPath() %>/BuyProduct" method="post">

<input type="hidden" name="id" value="<%= rs.getInt("Id") %>">

Qty:
<input type="number" name="qty" value="1" min="1">

<button type="submit">Buy</button>

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