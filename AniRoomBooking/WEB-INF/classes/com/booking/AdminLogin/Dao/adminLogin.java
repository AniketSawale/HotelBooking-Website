package com.booking.AdminLogin.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class adminLogin {
	
String query = "select * from adminLogin where ID=? and pin=?";
	
	public boolean Adminstatus(String adminID, String adminPin) throws ClassNotFoundException, SQLException {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417","EE_USER", "EE_PASS");
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, adminID);
		st.setString(2,adminPin);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			return true;
		}
		return false;
		
		
	}

}
