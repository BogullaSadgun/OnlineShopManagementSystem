<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase History</title>

<style>

body{
    font-family: Arial, Helvetica, sans-serif;
    background:#f2f4f8;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
    margin:0;
}

.container{
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.15);
    width:500px;
}

h2{
    text-align:center;
    margin-bottom:20px;
    color:#333;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#4CAF50;
    color:white;
    padding:10px;
    font-size:14px;
}

td{
    padding:10px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:hover{
    background:#f5f5f5;
}

.noData{
    text-align:center;
    padding:15px;
    color:#777;
}

</style>

</head>
<body>

<div class="container">

<h2>Your Purchase History</h2>

<table>
<tr>
<th>Product</th>
<th>Quantity</th>
<th>Total Price</th>
</tr>

<%
HttpSession session1 = request.getSession();
int userId = (int) session1.getAttribute("userId");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3307/onlineshop","root","root");

PreparedStatement ps = con.prepareStatement(
"select * from orders where UserId=?");

ps.setInt(1, userId);

ResultSet rs = ps.executeQuery();

boolean hasData = false;

while(rs.next()){
hasData = true;
%>

<tr>
<td><%= rs.getString("ProductName") %></td>
<td><%= rs.getInt("Qty") %></td>
<td>₹<%= rs.getDouble("Total") %></td>
</tr>

<%
}

if(!hasData){
%>
<tr>
<td colspan="3" class="noData">No purchases yet</td>
</tr>
<%
}
%>

</table>

</div>

</body>
</html>