package com.homefood.servlets;

import java.io.IOException;
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

		String control = request.getParameter("control");
		String customerId = request.getSession().getAttribute("id").toString();
        System.out.println(control+"    "+customerId);
        
      /**
       * Change password   
       */
		if(control.equals("pwd")){			
			ClientBean customer;
			byte[] encryptedPass = null;
	        byte[] salt = null;
	        
			String pwd1 = request.getParameter("password");
			String pwd2 = request.getParameter("password_again");
			
			System.out.println("The first password is: "+ pwd1);
			System.out.println("The second password is: "+ pwd2);

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
			if(ClientDAO.setCustomerPass(customer,customerId)){
				request.setAttribute("successMessage", "Password changed successfully."); 
				response.setHeader("Cache-Control", "no-cache, no-store");
				response.setHeader("Pragma", "no-cache");

				request.getSession().invalidate();
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
		        rd.include(request,response); 
			} else {
				request.setAttribute("errorMessage", "Unable to change password."); 
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			}
		}
		/**
		 * Edit profile		
		 */
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
				response.setHeader("Cache-Control", "no-cache, no-store");
				response.setHeader("Pragma", "no-cache");

				request.getSession().invalidate();
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
		        rd.include(request,response); 
			
			} else {
				request.setAttribute("errorMessage", "Unable to update profile."); 
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");    
				rd.include(request,response); 
			}
		}
	}
}
