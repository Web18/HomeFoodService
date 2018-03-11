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

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private PasswordEncryptionService pw = new PasswordEncryptionService();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		ClientBean customer;
		String subscribed;
		
		if(request.getParameter("subscribed") != null)
			subscribed = "yes";
		else
			subscribed = "no";
		
		String password = request.getParameter("password");
		byte[] encryptedPass = null;
        byte[] salt = null;
        
		try {
			salt = pw.generateSalt();
			encryptedPass = pw.getEncryptedPassword(password, salt);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}	
			
		customer = new ClientBean(
				encryptedPass,
				salt,
				request.getParameter("firstname"),
				request.getParameter("lastname"),
				request.getParameter("email"),
				request.getParameter("phone"),
				subscribed
				);
		//Display Error messages 
		if(ClientDAO.register(customer) > 0){
			request.setAttribute("successMessage", "Registration successful.You are ready to log in now.");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
            rd.include(request,response); 
		} else {
			request.setAttribute("errorMessage", "Unable to register. Please check your info.");   
            RequestDispatcher rd=request.getRequestDispatcher("register.jsp");    
            rd.include(request,response); 
		}

	}


}
