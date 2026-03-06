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

@WebServlet("/ULogin")
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/onlineshop", "root", "root");

            String qr = "select * from users where Email = ?";
            PreparedStatement ps = con.prepareStatement(qr);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String dbPassword = rs.getString("Password");
                int id = rs.getInt("Id"); 

            	String pss = rs.getString("Password");

                if (dbPassword.equals(pass)) {

                    HttpSession session = req.getSession();
                    session.setAttribute("userId", id);

                    resp.sendRedirect(req.getContextPath() + "/UserHome");

                } else {
                    req.setAttribute("msg", "Invalid Password");
                    req.getRequestDispatcher("/UserLoginPage.jsp")
                       .forward(req, resp);
                }

            } else {
                req.setAttribute("msg", "Invalid Email");
                req.getRequestDispatcher("/UserLoginPage.jsp")
                   .forward(req, resp);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}