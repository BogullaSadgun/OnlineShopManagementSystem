package org.jsp;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBConncetion {

	private static Connection con;
	private static final String url = "jdbc:mysql://localhost:3307/onlineshop";
	private static final String username = "root";
	private static final String password = "root";
	
	public static Connection getcon() {
		
		try {
			
			if(con==null || con.isClosed()) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection(url,username,password);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
