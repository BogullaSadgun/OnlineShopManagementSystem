package org.jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Usign")
public class UserSign extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		long Mnum = Long.parseLong(req.getParameter("Mnum"));
		int age = Integer.parseInt(req.getParameter("age"));
		String address = req.getParameter("address");
		
		PrintWriter out = resp.getWriter();
		
		try {
			
			String url = "jdbc:mysql://localhost:3307/onlineshop";
			String Username = "root";
			String Password = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection(url,Username,Password);
			PreparedStatement ps = con.prepareStatement("insert into users (Name,Age,Email,password,MobileNumber,Address) values (?,?,?,?,?,?)");

			ps.setString(1, name);
			ps.setInt(2, age);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.setLong(5, Mnum);
			ps.setString(6, address);
			
			int enter = ps.executeUpdate();
			
			if(enter > 0) {
				RequestDispatcher rs = req.getRequestDispatcher("UserLoginPage.jsp");
				rs.forward(req, resp);
			}
			else {
				RequestDispatcher rs = req.getRequestDispatcher("UserSigupPage.jsp");
				out.println("<html><body>");
				out.println("<p>invalid data entry</p>");
				out.println("</body></html>");
				rs.include(req, resp);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}