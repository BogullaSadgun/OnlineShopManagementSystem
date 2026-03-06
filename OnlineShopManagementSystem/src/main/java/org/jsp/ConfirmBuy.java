package org.jsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ConfirmBuy")
public class ConfirmBuy extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String pname = req.getParameter("pname");
		int qty = Integer.parseInt(req.getParameter("qty"));
		double total = Double.parseDouble(req.getParameter("total"));

		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop", "root", "root");

			PreparedStatement ps = con.prepareStatement("insert into orders(UserId,ProductName,Qty,Total) values(?,?,?,?)");

			ps.setInt(1, userId);
			ps.setString(2, pname);
			ps.setInt(3, qty);
			ps.setDouble(4, total);

			ps.executeUpdate();

			resp.sendRedirect("UserHomepage.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}