<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Html tags -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!-- Internationalization imports -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.homefood.languageResources.text" />

<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") == null) response.sendRedirect("login.jsp");
%>
<jsp:useBean id="cart" scope="session" class="com.homefood.beans.ShoppingCartBean" />
<jsp:useBean id="customer" scope="session" class="com.homefood.beans.ClientBean" />

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.homefood.beans.ProductBean"%>
<%@ page import="com.homefood.beans.AddressBean" %>
<%@ page import="com.homefood.util.ClientDAO" %>


<%
	if(session.getAttribute("id") != null){
		cart.calculateOrder();
		cart.setUserId(session.getAttribute("id").toString());
	    customer.setAddresses(ClientDAO.getCustomerAddresses(customer.getId()));
		request.getSession().setAttribute("cart", cart);
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<!-- Style Links -->
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.4/style/style.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="bootstrap-3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap-theme.min.css">
<script src="js/scripts.js"></script>

<script src="js/jquery.validate.min.js"> </script>
<script src="js/register-form-validation.js"> </script>

<c:set var="locale" value="${language}"/>
<c:if test="${locale == 'fr'}">
    <script src="js/messages_fr.js" type="text/javascript"> </script>
</c:if> 


</head>
<body>
<!-- Header Tags -->
	<t:header></t:header>
	
<!-- Display Error messages -->
	<% if(request.getAttribute("errorMessage") != null) { %>
	<div class="alert alert-danger" role="alert">${errorMessage}</div>
	<% } %>
	
	<script src="js/bootstrap-table/bootstrap-table.min.js"></script>
	<%if(cart.getNumberOfItems() == 0){ %>
	<div class="container container-style">
		<div class="container-fluid">
			<div class="row">
				<h1><fmt:message key="message.empty"/></h1>
			</div>
		</div>
	</div>
	<%} else { %>
	<div class="container container-style">
		<div class="checkout">
			<h1 style="color:red;">Checkout</h1>

			<table class="table">
				<tr>
					<td>Subtotal</td>
					<td>Delivery</td>
					<td>GST/HST</td>
					<td>PST</td>
					<td>Discount</td>
					<td><b>Order Total</b></td>
				</tr>
				<tr>
					<td>$ <%=cart.getSubTotal()%></td>
					<td>$ <%=cart.getDeliveryCharge()%></td>
					<td>$ <%=cart.getTaxes()%></td>
					<td>$ <%=cart.getPst()%></td>
					<td>$ <%=cart.getDiscount()%></td>
					<td>$ <%=cart.getOrderTotal()%></td>
				</tr>
			</table>
			<form method="post" action="checkout" id="checkout">
				<div class="address">
					<h3><fmt:message key="checkout.address"/></h3>
					
					<div class="deliveryaddress">
						<div class="container-fluid ">
							<div class="row">
								
								</div>
							</div>
							<div class="row">
									<div class="form-group">
										<label for="alias"><fmt:message key="checkout.alais"/></label> 
										<input name="alias" class="form-control" id="alias"
											>
								</div>
							</div>
							<div class="row">
									<div class="form-group">
										<label for="address1"><fmt:message key="checkout.address1"/></label> <input
											name="address1" class="form-control" id="address1"
											>
									</div>
									<div class="form-group">
										<label for="address2"><fmt:message key="checkout.address2"/></label> <input
											name="address2" class="form-control" id="address2"
											>
									</div>
							</div>
							<div class="row">
									<div class="form-group">
										<label for="city"><fmt:message key="checkout.city"/></label> <input name="city"
											class="form-control" id="city" >
									</div>
									<div class="form-group">
										<label for="province"><fmt:message key="checkout.province"/></label> <input name="province"
											class="form-control" id="province" >
									</div>
									<div class="form-group">
										<label for="postalcode"><fmt:message key="checkout.postalcode"/></label> <input
											name="postalcode" class="form-control" id="postalcode"
											>
									</div>
							</div>
							<div class="row">
									<div class="form-group">
										<label for="phone"><fmt:message key="checkout.phone"/></label> <input name="phone"
											class="form-control" id="phone"
											>
									</div>
									<div class="form-group">
										<label for="buzzer"><fmt:message key="checkout.buzzer"/></label> <input name="buzzer"
											class="form-control" id="buzzer"
											>
									</div>
								</div>
								<div class="placeorder">
					<hr>
													<button class="btn btn-warning pull-right" id="placeorder"><fmt:message key="checkout.checkaddress"/></button>
															</div>
								
					</div>
				</div>							
			</form>
						<div class="clearfix"></div>
		</div>
	</div>
	<%} %>
	<!-- Footer Tags -->
	<t:footer></t:footer>
</body>
</html>