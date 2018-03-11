package com.homefood.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homefood.beans.ClientBean;
import com.homefood.util.ClientDAO;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();    
          
        String email = request.getParameter("email");    
        String password = request.getParameter("password");
             
        HttpSession session = request.getSession(false);
  
        if(ClientDAO.login(email, password)){
        	ClientBean customer = ClientDAO.getCustomer(email);
        	System.out.println(customer.toString());
        	if(session!=null){
	        	session.setAttribute("id", customer.getId());
	        	session.setAttribute("firstname", customer.getFirstName());
	        	session.setAttribute("lastname", customer.getLastName());
	        	session.setAttribute("email", customer.getEmail());
	        	session.setAttribute("customer", customer);
        	}
        	
        	if(request.getParameter("origin").equals("menu")){
        		response.sendRedirect("checkout.jsp");
            } else {
            	response.sendRedirect("index.jsp");
            }
        	  
        }    
        else{    
            out.print("<p style=\"color:red\">Sorry username or password error, Please try again</p>"); 
            request.setAttribute("errorMessage", "Username or password incorrect,Please try again");
            request.getRequestDispatcher("login.jsp").forward(request, response);   
        }    
  
        out.close();
	}

}
