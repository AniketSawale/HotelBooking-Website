package com.hotelBooking.CustomerLoginDoa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class customerLoginDao{
	
	String query = "select emailID, customerPassword  from Anik_Customer where emailID=? and customerPassword=?";
	
	public boolean status(String customerEmail, String customerPassword) throws ClassNotFoundException, SQLException {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417", "EE_USER", "EE_PASS");
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, customerEmail);
		st.setString(2,customerPassword );
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			return true;
		}
		return false;
		
		
	}
	
}
