package org.jsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteProduct")
public class DelereProduct extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/onlineshop",
					"root",
					"root");

			PreparedStatement ps = con.prepareStatement(
					"delete from products where Id=?");

			ps.setInt(1, id);

			ps.executeUpdate();

			resp.sendRedirect("SellerHome.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}