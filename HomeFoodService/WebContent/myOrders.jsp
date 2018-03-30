<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%

	ArrayList<OrderBean> order_list = null;
	String[] order = null;

		order_list = OrderDAO.getOrders(session.getAttribute("id").toString());

%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.homefood.beans.ProductBean" %>
<%@ page import="com.homefood.beans.OrderBean" %>
<%@ page import="com.homefood.util.OrderDAO" %>
<%@ page import="com.homefood.util.ClientDAO" %>



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
	<t:header></t:header>
	<div class="container container-style">
		<div class="container-fluid">
			
			<div class="row">
				<h1 style="color:red;">My Orders</h1>
				<table class="table">
					<tr>
						<th>Date in</th>
						<th>Total amount</th>
						<th>Status</th>
					</tr>
					<% for(OrderBean o : order_list){ %>
						<tr>
							<td><%=o.getDate_in()%></td>
							<td>$<%=o.getTotal_amount()%></td>
							<td><%=o.getStage()%></td>
							
						</tr>
			<%} %>
				</table>	
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<a href="index.jsp?" class="btn btn-lg pull-right">Done</a>
				</div>
			</div>
		</div>
	</div>

	<t:footer></t:footer>
</body>
</html>