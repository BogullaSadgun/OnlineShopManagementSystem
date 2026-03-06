package org.jsp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddProductServlet extends HttpServlet{

	@WebServlet("/AddProduct")
	public class AddProduct extends HttpServlet{

	protected void doPost(HttpServletRequest req,HttpServletResponse resp){

	try{

	String name=req.getParameter("name");
	String category=req.getParameter("category");
	double price=Double.parseDouble(req.getParameter("price"));

	HttpSession session=req.getSession();
	int sellerId=(int)session.getAttribute("sellerId");

	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection con=DriverManager.getConnection(
	"jdbc:mysql://localhost:3307/onlineshop","root","root");

	PreparedStatement ps=con.prepareStatement(
	"insert into products(ProductName,Category,Price,SellerId) values(?,?,?,?)");

	ps.setString(1,name);
	ps.setString(2,category);
	ps.setDouble(3,price);
	ps.setInt(4,sellerId);

	ps.executeUpdate();

	resp.sendRedirect("SellerHome.jsp");

	}catch(Exception e){
	e.printStackTrace();
	}

	}

	}
	
}
