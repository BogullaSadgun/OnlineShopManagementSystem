<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>

<style>

body{
	margin:0;
	font-family:Arial, Helvetica, sans-serif;
	background:linear-gradient(135deg,#4facfe,#00f2fe);
	height:100vh;
	display:flex;
	align-items:center;
	justify-content:center;
}

.container{
	background:white;
	padding:35px;
	width:380px;
	border-radius:10px;
	box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
	text-align:center;
	margin-bottom:25px;
	color:#333;
}

label{
	font-weight:bold;
	font-size:14px;
	display:block;
	margin-bottom:6px;
}

input{
	width:100%;
	padding:10px;
	margin-bottom:18px;
	border:1px solid #ccc;
	border-radius:6px;
}

input:focus{
	outline:none;
	border-color:#4facfe;
	box-shadow:0 0 5px rgba(79,172,254,0.4);
}

button{
	width:100%;
	padding:11px;
	border:none;
	background:#4facfe;
	color:white;
	font-size:15px;
	border-radius:6px;
	cursor:pointer;
	transition:0.25s;
}

button:hover{
	background:#2e8df5;
	transform:scale(1.03);
}

</style>
</head>

<body>

<%

	int id = Integer.parseInt(request.getParameter("id"));

	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3307/onlineshop","root","root");

	PreparedStatement ps = con.prepareStatement(
	"select * from products where Id=?");

	ps.setInt(1,id);

	ResultSet rs = ps.executeQuery();

	rs.next();

%>

<div class="container">

<h2>Update Product</h2>

<form action="UpdateProduct" method="post">

<input type="hidden" name="id" value="<%=id%>">

<label>Product Name</label>
<input type="text" name="name"
value="<%= rs.getString("ProductName") %>">

<label>Category</label>
<input type="text" name="category"
value="<%= rs.getString("Category") %>">

<label>Price</label>
<input type="number" name="price"
value="<%= rs.getDouble("Price") %>">

<button>Update Product</button>

</form>

</div>

</body>
</html>