package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClientBean;
import beans.ShoppingCartBean;
import util.ClientDAO;

public class CheckoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String id = "";
		if(request.getParameter("selectaddress").equals("newaddress")){
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
		} else {
			id = request.getParameter("selectaddress");
		}
				
		ShoppingCartBean cart = (ShoppingCartBean) request.getSession().getAttribute("cart");

		cart.setPaymentMethod(request.getParameter("payment_method"));
		cart.setDeliveryAddressId(id);
		String orderId = cart.checkout();
		if(!orderId.equals("")){
			response.sendRedirect("order_summary.jsp?oid="+orderId);
		}


	}


}
