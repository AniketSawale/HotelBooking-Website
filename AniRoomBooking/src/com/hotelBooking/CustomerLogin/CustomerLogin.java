package com.hotelBooking.CustomerLogin;
import com.hotelBooking.CustomerLoginDoa.*;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

@WebServlet("/customerLogin")
public class CustomerLogin extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.getWriter().append("Served at: ").append(request.getContextPath());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/CustomerLogin.jsp");
			
			dispatcher.forward(request, response);
			}


		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String customerEmail = request.getParameter("email");
			HttpSession session = request.getSession();
			session.setAttribute("EmailID", customerEmail);
		
			String customerPassword = request.getParameter("password");
			
			customerLoginDao dao = new customerLoginDao();
			
			
				try {
					if(dao.status(customerEmail, customerPassword)) {
						
						response.sendRedirect("/PracticeJSP/indexAvailable.jsp");
					}
					else {
						response.sendRedirect("/PracticeJSP/CustomerLogin.jsp");
					}
				} catch (ClassNotFoundException | SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			
		}


}
