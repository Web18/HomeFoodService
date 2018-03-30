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

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.homefood.beans.ProductBean" %>
<%@ page import="com.homefood.util.OrderDAO" %>
<%@ page import="com.homefood.util.ClientDAO" %>

<%
	String orderId = request.getParameter("oid").toString();
	ArrayList<ProductBean> items = OrderDAO.getItems(orderId);
	System.out.println(items);
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
<script src="bootstrap-3.3.4/js/scripts.js"></script>

</head>
<body>
<!-- Header Tags -->
	<t:header></t:header>

	<div class="container container-style">
		<div class="container-fluid">
			<div class="row">
				<h1 style="color:red;"><fmt:message key="order.thanks"/> <%=session.getAttribute("firstname")%>, <fmt:message key="order.placed"/> </h1>
			</div>
			<div class="row graybg-radius">
				<div class="col-md-6">
					<h4><fmt:message key="order.address"/></h4>
					<table class="table">
						<tr><td><b><%=order[6]%></b></td></tr>
						<tr>
							<td>
								<%=order[7]%> <%=order[8]%><br/>
								<%=order[9]%>, <%=order[10]%><br/>
								<%=order[11].toUpperCase()%><br/>
								<fmt:message key="order.buzzer"/>: <%=order[12]%><br/>
							</td>
						</tr>
					</table>
					
				</div>
				<div class="col-md-6">
					<h4><fmt:message key="order.summary"/></h4>
					<table class="table">
						<tr><td><b><fmt:message key="order.subtotal"/></b> </td><td>$<%=order[1]%></td></tr>
						<tr><td><b><fmt:message key="order.taxes"/></b> </td><td>$<%=order[2]%></td></tr>
						<tr><td><b><fmt:message key="order.charge"/></b> </td><td>$<%=order[3]%></td></tr>
						<tr><td><b><fmt:message key="order.discount"/></b> </td><td>$<%=order[4]%></td></tr>
						<tr><td><b><fmt:message key="order.total"/></b> </td><td>$<%=order[0]%></td></tr>						
					</table>
				</div>
			</div>
					<div class="row">
				<h4>Order Items</h4>
				<table class="table">
					<tr>
						<th>Quantity</th>
						<th>Name</th>
						<th>Price</th>
						<th>Size</th>
						<th>Total</th>
					</tr>
					<% for(ProductBean item : items){ %>
						<tr>
							<td><%=item.getQuantity()%></td>
							<td><%=item.getName()%></td>
							<td>$<%=item.getPriceOut()%></td>
							<td><%=item.getSize()%></td>
							<td>$<%=item.getCalculatedTotalPrice() %></td>
						</tr>
					<% } %>
				</table>	
			</div>
			<div class="row">
				<div class="col-md-12">
					<a href="myOrders.jsp?oid=<%=orderId%>" class="btn btn-warning btn-lg pull-right">My Orders</a>
					<a href="index.jsp?" class="btn btn-lg pull-right"><fmt:message key="order.close"/></a>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Tags -->
	<t:footer></t:footer>
</body>
</html>