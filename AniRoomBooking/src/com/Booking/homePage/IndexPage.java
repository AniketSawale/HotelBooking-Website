//<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
package com.Booking.homePage;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Booking.homePage.Dao.homePageDao;
import com.Booking.homePage.Model.bookingLoginModel;

/**
 * Servlet implementation class IndexPage
 */
@WebServlet("/IndexPage")
public class IndexPage extends HttpServlet {
	private static final long serialVersionUID = 1L;	
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.getWriter().append("Served at: ").append(request.getContextPath());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/confirmationPage.jsp");
			
			dispatcher.forward(request, response);
			
			
				
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String Room = request.getParameter("name");
		String email = (String) session.getAttribute("EmailID");
		String status = request.getParameter("status");
		
		bookingLoginModel login = new bookingLoginModel();
		
		login.setCustomerEmail(email);
		login.setRoom(Room);
		login.setStatus(status);
		
		try {
			homePageDao.customerHomePage(login);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("/PracticeJSP/customerAccount.jsp");
		
	}

}
