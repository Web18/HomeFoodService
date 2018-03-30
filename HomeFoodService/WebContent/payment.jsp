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
<%@ page import="com.homefood.util.OrderDAO" %>
<%@ page import="com.homefood.util.ClientDAO" %>

<%
String orderId;
ArrayList<ProductBean> items = null;
 orderId = request.getParameter("oid").toString();
items = OrderDAO.getItems(orderId);
	String[] order = OrderDAO.getOrder(orderId);
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
<script>
	$(document).ready(function() {
		$(".payatdoor").css('display', 'none');
		$(".payonline").css('display', 'none');

		$("#payAtDoor").click(function() {
			$(".payonline").css('display', 'none');
			$(".payatdoor").css('display', 'block');
		});

		$("#payOnline").click(function() {
			$(".payatdoor").css('display', 'none');
			$(".payonline").css('display', 'block');
		});
	});
</script>

</head>
<body>
<!-- Header Tags -->
	<t:header></t:header>
<div class="container container-style">
				<div class="payment">		
					<h3><fmt:message key="checkout.payment"/></h3>
					<fmt:message key="checkout.paymentmsg"/>
					<div class="radio">
						<label><input type="radio" name="payment" id="payAtDoor"><fmt:message key="checkout.doorpay"/></label> 
						<label><input type="radio" name="payment" id="payOnline"><fmt:message key="checkout.payonline"/></label>
					</div>
					<div class="payatdoor" id="payatdoor">
						<div class="method">
							<select name="payment_method" class="form-control">
								<option value="cash"><fmt:message key="checkout.cash"/></option>
								<option value="credit"><fmt:message key="checkout.credit"/></option>
								<option value="debit"><fmt:message key="checkout.debit"/></option>
							</select>
						</div>
					</div>
					<div class="payonline" id="payonline">
					<script
    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
    data-key="pk_test_7BMQ5TO1NR7xcVpTuFvGKmkw"
    data-amount=""
    data-name="Pay Online"
    data-description=""
    data-image=""
    data-locale="auto"
    data-zip-code="true">
  </script>
				</div>

				<div class="placeorder">
					<hr>
					<a href="order_summary.jsp?oid=<%=orderId%>" class="btn btn-warning btn-lg pull-right"><fmt:message key="checkout.order"/></a>
				</div>
		
			<div class="clearfix"></div>
			</div>
			</div>
	<!-- Footer Tags -->
	<t:footer></t:footer>
</body>
</html>