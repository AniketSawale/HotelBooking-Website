package com.registration.BookingDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.registration.BookingModel.customerRegistration;

import java.sql.DriverManager;

// This java file is use to connect the servlet with database.

public class customerRegistrationDao {
	
	
	public int registerCustomer(customerRegistration customer) throws ClassNotFoundException, SQLException {
		String query = "INSERT INTO Anik_Customer" + 
	" VALUES " + "(?,?,?,?,?,?,?);" ;
		int result = 0;
		
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Driver Registration.
		
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417", "EE_USER","EE_PASS");//Connection.
		
		// Creating the prepared Statement.
		PreparedStatement preparedStatement = connection.prepareStatement(query); {
			
			preparedStatement.setString(1, customer.getFirstName());
			preparedStatement.setString(2, customer.getLastName());
			preparedStatement.setString(3, customer.getEmail());
			preparedStatement.setString(4, customer.getPassword());
			preparedStatement.setString(5, customer.getAddress());
			preparedStatement.setString(6, customer.getCity());
			preparedStatement.setString(7, customer.getErCode());
			
			System.out.println(preparedStatement);
			
			result = preparedStatement.executeUpdate();
			
			
		}
		
		return result;
		
		
		
		
	}
	

}
