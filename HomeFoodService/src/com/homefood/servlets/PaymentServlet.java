package com.homefood.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String orderId = request.getParameter("oid").toString();
		if(!orderId.equals("")){
			response.sendRedirect("order_summary.jsp?oid="+orderId);
		}
	}
}
