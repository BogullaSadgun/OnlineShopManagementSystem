package org.jsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateSellerAccount")
public class UpdateSellerAccount extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException{

		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");

		HttpSession session=req.getSession();
		int sellerId=(int)session.getAttribute("sellerId");

		try{

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con=DriverManager.getConnection(
			"jdbc:mysql://localhost:3307/onlineshop","root","root");

			PreparedStatement ps=con.prepareStatement(
			"update sellers set Name=?,Email=?,Password=? where Id=?");

			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,password);
			ps.setInt(4,sellerId);

			ps.executeUpdate();

			con.close();

			resp.sendRedirect("SellerHome.jsp");

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}