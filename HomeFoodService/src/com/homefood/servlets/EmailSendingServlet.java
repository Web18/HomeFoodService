package com.homefood.servlets;
 
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homefood.beans.EmailBeans;
 
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = "homefood.info@gmail.com";
        String email = request.getParameter("email");
        String subject = request.getParameter("name");
        String content = request.getParameter("message");
        try {
            EmailBeans.sendEmail(host, port, user, pass, recipient, email, subject, content);

			request.setAttribute("successMessage", "The e-mail was sent successfully"); 
			RequestDispatcher rd=request.getRequestDispatcher("contact.jsp");    
	        rd.include(request,response); 
	        
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "Error has been occured while sending your email");   
            RequestDispatcher rd=request.getRequestDispatcher("contact.jsp");    
            rd.include(request,response); 
        } finally {
            
        }
    }
}