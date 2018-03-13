package com.homefood.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homefood.beans.ClientBean;
import com.homefood.util.ClientDAO;
import com.homefood.util.PasswordEncryptionService;


public class ProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private PasswordEncryptionService pw = new PasswordEncryptionService();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		PrintWriter out = response.getWriter();

		String control = request.getParameter("control");
		String customerId = request.getSession().getAttribute("id").toString();
        System.out.println(control+"    "+customerId);
        
        
		if(control.equals("pwd")){			
			ClientBean customer;
			byte[] encryptedPass = null;
	        byte[] salt = null;
	        
			String pwd1 = request.getParameter("password");
			String pwd2 = request.getParameter("password_again");
			try {
				salt = pw.generateSalt();
				encryptedPass = pw.getEncryptedPassword(pwd1, salt);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				e.printStackTrace();
			}	
			customer = new ClientBean(
					encryptedPass,
					salt				
					);
			 System.out.println("The new pass is:    "+ pwd1); //Just for debugging 
			 System.out.println("The confirm pass is:    "+ pwd2); //Just for debugging 
			 
			if(ClientDAO.setCustomerPass(customer,customerId)){
				request.setAttribute("successMessage", "Password changed successfully.");

				response.setHeader("Cache-Control", "no-cache, no-store");
				response.setHeader("Pragma", "no-cache");
				request.getSession().invalidate();
				response.sendRedirect(request.getContextPath() + "/login.jsp");
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
			String subscribed;
			if(request.getParameter("subscribed") != null)
				subscribed = "yes";
			else
				subscribed = "no";
			if(ClientDAO.setCustomerProfile(firstname, lastname, email, phone, subscribed, customerId)){
				request.setAttribute("successMessage", "Profile Update successfully."); 
				/** TODO: Check success messages and error messages*/
				
				response.setHeader("Cache-Control", "no-cache, no-store");
				response.setHeader("Pragma", "no-cache");
				request.getSession().invalidate();
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			
			} else {
				out.print("<p>Unable to update profile.</p>");    
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			}
		}
     
        //Change address process
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
