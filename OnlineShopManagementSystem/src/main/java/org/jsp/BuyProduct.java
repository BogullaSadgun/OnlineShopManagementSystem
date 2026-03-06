package org.jsp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BuyProduct")

public class BuyProduct extends HttpServlet{


	protected void doPost(HttpServletRequest req , HttpServletResponse resp)
			throws ServletException , IOException{


		int id  = Integer.parseInt(req.getParameter("id"));
		int qty = Integer.parseInt(req.getParameter("qty"));


		try{


			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop","root","root");

			PreparedStatement ps = con.prepareStatement("select * from products where Id=?");

			ps.setInt(1 , id);


			ResultSet rs = ps.executeQuery();


			if(rs.next()){


				double price = rs.getDouble("Price");

				double total = price * qty;



				req.setAttribute("total" , total);

				req.setAttribute("pname" , rs.getString("ProductName"));

				req.setAttribute("qty" , qty);



				req.getRequestDispatcher("FinalPage.jsp").forward(req , resp);

			}



		}
		catch(Exception e){

			e.printStackTrace();

		}


	}

}