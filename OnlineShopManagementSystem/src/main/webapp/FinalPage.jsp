<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Summary</title>

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

.info{
    margin:8px 0;
    font-size:16px;
}

.label{
    font-weight:bold;
    color:#444;
}

button{
    width:100%;
    margin-top:15px;
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

<h2>Order Summary</h2>

<div class="info">
<span class="label">Product:</span> ${pname}
</div>

<div class="info">
<span class="label">Quantity:</span> ${qty}
</div>

<div class="info">
<span class="label">Total Price:</span> ₹${total}
</div>

<form action="<%= request.getContextPath() %>/ConfirmBuy" method="post">

    <input type="hidden" name="pname" value="${pname}">
    <input type="hidden" name="qty" value="${qty}">
    <input type="hidden" name="total" value="${total}">

    <button type="submit">Confirm Purchase</button>

</form>

</div>

</body>
</html>