package org.jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SSignup")
public class SellerSignup extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	    resp.setContentType("text/html");

	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    String name = req.getParameter("name");
	    long mobileNumber = Long.parseLong(req.getParameter("mobileNumber"));
	    String shopName = req.getParameter("ShopName");
	    String address = req.getParameter("address");
	    
	    PrintWriter outPrintWriter = resp.getWriter();
	    
	    try {
	    	
	    	String url = "jdbc:mysql://localhost:3307/onlineshop";
			String Username = "root";
			String Password = "root";
	    	
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con = DriverManager.getConnection(url,Username,Password);
	    	String qr = "insert into sellers (Email,Password,Name,MobileNumber,ShopName,Address) values (?,?,?,?,?,?)";
	    	PreparedStatement ps = con.prepareStatement(qr);
	    	ps.setString(1, email);
	    	ps.setString(2, password);
	    	ps.setString(3, name);
	    	ps.setLong(4, mobileNumber);
	    	ps.setString(5, shopName);
	    	ps.setString(6, address);
	    	int done = ps.executeUpdate();
	    	
	    	if(done>0) {
	    		req.getRequestDispatcher("SellerLogin.jsp").forward(req, resp);
	    	}
	    	else {
	    		req.setAttribute("msg", "Signup Failed");
	    	    req.getRequestDispatcher("SellerSignup.jsp").forward(req, resp);
	    	}
	    	
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	   
	}
	
}
