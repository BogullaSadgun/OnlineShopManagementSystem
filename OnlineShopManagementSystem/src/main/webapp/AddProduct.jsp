<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<style>

body{
margin:0;
font-family:Arial,Helvetica,sans-serif;
background:linear-gradient(120deg,#4facfe,#00f2fe);
height:100vh;
display:flex;
align-items:center;
justify-content:center;
}

.container{
background:white;
padding:40px;
border-radius:12px;
width:380px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
text-align:center;
margin-bottom:25px;
}

label{
font-weight:bold;
}

input{
width:100%;
padding:10px;
margin-top:6px;
margin-bottom:18px;
border:1px solid #ccc;
border-radius:6px;
font-size:14px;
}

input:focus{
outline:none;
border-color:#4facfe;
box-shadow:0 0 5px rgba(79,172,254,0.5);
}

button{
width:100%;
padding:12px;
background:#4facfe;
border:none;
color:white;
font-size:16px;
border-radius:6px;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#0077ff;
transform:scale(1.03);
}

</style>

</head>

<body>

<div class="container">

<h2>Add Product</h2>

<form action="AddProduct" method="post">

<label>Product Name</label>
<input type="text" name="name" placeholder="Enter product name" required>

<label>Category</label>
<input type="text" name="category" placeholder="Enter category" required>

<label>Price</label>
<input type="number" name="price" placeholder="Enter price" required>

<button type="submit">Add Product</button>

</form>

</div>

</body>
</html>