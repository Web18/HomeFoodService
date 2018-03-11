package com.homefood.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homefood.util.ClientDAO;


public class ProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		PrintWriter out = response.getWriter();

		String control = request.getParameter("control");
		String customerId = request.getSession().getAttribute("id").toString();
        System.out.println(control+"    "+customerId);
		if(control.equals("pwd")){
			String pwd1 = request.getParameter("password");
			String pwd2 = request.getParameter("password_again");
			
			 System.out.println("The new pass is:    "+ pwd1); //Just for debugging 
			 System.out.println("The confirm pass is:    "+ pwd2); //Just for debugging 
			 
			if(ClientDAO.setCustomerPwd(pwd1, customerId)){
				request.setAttribute("successMessage", "Password changed successfully.");
	            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request,response); 
			} else {
				out.print("<p>Unable to change password.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response);
			}
		}
		if(control.equals("profile")){
			String email = request.getParameter("email");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String phone = request.getParameter("phone");
			String phone2 = request.getParameter("phone2");
			String subscribed;
			if(request.getParameter("subscribed") != null)
				subscribed = "yes";
			else
				subscribed = "no";
			if(ClientDAO.setCustomerProfile(firstname, lastname, email, phone, phone2, subscribed, customerId)){
				request.setAttribute("successMessage", "Profile Update successfully.");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
				rd.include(request,response); 
			} else {
				out.print("<p>Unable to update profile.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			}
		}
		if(control.equals("address")){
			if(request.getParameter("submit").equals("Update")){
				String addressId = request.getParameter("selectaddress");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String city = request.getParameter("city");
				String province = request.getParameter("province");
				String postal_code = request.getParameter("postalcode");
				String phone = request.getParameter("phone");
				String buzzer = request.getParameter("buzzer");
				if(ClientDAO.setCustomerAddress(address1, address2, city, province, postal_code, buzzer, phone, customerId, addressId)){
					out.print("<p>Address changed successfully.</p>");    
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
					rd.include(request,response); 
				} else {
					out.print("<p>Unable to change address.</p>");    
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
					rd.include(request,response);
				}
			}
			else if(request.getParameter("submit").equals("Delete")){
				String addressId = request.getParameter("selectaddress");
				if(ClientDAO.deleteAddress(addressId) > 0){
					out.print("<p>Address deleted.</p>");    
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
					rd.include(request,response);
				}
			}
		}
	}
}
