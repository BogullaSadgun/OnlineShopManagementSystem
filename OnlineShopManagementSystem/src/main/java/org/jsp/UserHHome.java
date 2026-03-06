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

@WebServlet("/UserHome")
public class UserHHome extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String category = req.getParameter("cat");
        String keyword = req.getParameter("keyword");

        req.setAttribute("cat", category);
        req.setAttribute("keyword", keyword);

        req.getRequestDispatcher("UserHomepage.jsp").forward(req, resp);
    }
}