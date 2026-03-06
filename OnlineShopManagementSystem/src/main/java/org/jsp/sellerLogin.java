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
import javax.servlet.http.HttpSession;

@WebServlet("/Slogin")
public class sellerLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {

            String url = "jdbc:mysql://localhost:3307/onlineshop";
            String Username = "root";
            String Password = "root";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, Username, Password);

            String qr = "select * from sellers where Email = ?";
            PreparedStatement ps = con.prepareStatement(qr);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String dbPassword = rs.getString("Password");

                if (password.equals(dbPassword)) {
                	
                	int sellerId = rs.getInt("id");

                    HttpSession session = req.getSession();
                    session.setAttribute("sellerId", sellerId);

                    req.getRequestDispatcher("SellerHome.jsp").forward(req, resp);

                } else {

                    req.setAttribute("msg", "Invalid Password");
                    req.getRequestDispatcher("SellerLogin.jsp").forward(req, resp);
                }

            } else {

                req.setAttribute("msg", "Invalid Email");
                req.getRequestDispatcher("SellerLogin.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "Something went wrong");
            req.getRequestDispatcher("SellerLogin.jsp").forward(req, resp);
        }
    }
}