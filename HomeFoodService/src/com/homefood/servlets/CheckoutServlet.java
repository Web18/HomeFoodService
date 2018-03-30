package com.homefood.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homefood.beans.ClientBean;
import com.homefood.beans.ShoppingCartBean;
import com.homefood.util.AddressValidation;
import com.homefood.util.ClientDAO;

public class CheckoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String postcode = request.getParameter("postalcode");
		AddressValidation address = new AddressValidation();
		
	 String latLongs[] = null;
	 String latLongs1[] = null;
	 double distance = 0;

	try {
		latLongs = address.getLatLongPositions(postcode);
		latLongs1 = address.getLatLongPositions("k2l3s5");
		
		double lat1 = Double.parseDouble(latLongs[0]);
		double long1 = Double.parseDouble(latLongs[1]);
		
		double lat2 = Double.parseDouble(latLongs1[0]);
		double long2 = Double.parseDouble(latLongs1[1]);
		distance = address.haversine(lat1, long2, lat2, long2);
		
		System.out.println("Latitude: "+lat1+" and Longitude: "+long1);
		System.out.println("Latitude1: "+lat2+" and Longitude1: "+long2);
		System.out.println("the distance is: "+ distance);

		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	
	if(distance < 30) {
		String id = "";
			id = ClientDAO.addAddress(
				request.getParameter("alias"),
				request.getParameter("address1"),
				request.getParameter("address2"), 
				request.getParameter("city"), 
				request.getParameter("province"), 
				request.getParameter("postalcode"), 
				request.getParameter("phone"), 
				request.getParameter("buzzer"), 
				request.getSession().getAttribute("id").toString()
				);
			ClientBean customer = (ClientBean) request.getSession().getAttribute("customer");
			customer.setAddresses(ClientDAO.getCustomerAddresses(request.getSession().getAttribute("id").toString()));
			
		ShoppingCartBean cart = (ShoppingCartBean) request.getSession().getAttribute("cart");

		cart.setPaymentMethod(request.getParameter("payment_method"));
		cart.setDeliveryAddressId(id);
		String orderId = cart.checkout();
		if(!orderId.equals("")){
			response.sendRedirect("payment.jsp?oid="+orderId);
		}
	}else  {
		request.setAttribute("errorMessage", "The address provided is invalid for delivery service."); 
		RequestDispatcher rd=request.getRequestDispatcher("checkout.jsp");    
		rd.include(request,response); 
	}

	}
}
