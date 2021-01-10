package com.Booking.homePage.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Booking.homePage.Model.bookingLoginModel;

public class homePageDao {
	
	
	public static int customerHomePage(bookingLoginModel login) throws ClassNotFoundException, SQLException {
		String query = "INSERT INTO bookingStatus" + "VALUES " +
				"(?,?,?)" ;
		int result = 0;
		
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Driver Registration.
		
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417", "EE_USER","EE_USER");//Connection.
		
		// Creating the prepared Statement.
		PreparedStatement preparedStatement = connection.prepareStatement(query); {
			
			preparedStatement.setString(1, login.getCustomerEmail());
			preparedStatement.setString(2, login.getRoom());
			preparedStatement.setString(3, login.getStatus());
			
			
			System.out.println(preparedStatement);
			
			result = preparedStatement.executeUpdate();
			
			
		}
		
		return result;
		
		
		
		
	}

}
