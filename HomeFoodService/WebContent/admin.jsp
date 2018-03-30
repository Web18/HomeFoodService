<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Html tags -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!-- Internationalization -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.homefood.languageResources.text" />
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Admin Panel</title>

<!-- Style Links -->
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.4/style/style.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="bootstrap-3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap-theme.min.css">

</head>
<body>

<div class="container">
	<div class="container-fluid container-style">
		
				<h1 style="color:red;">
					Admin Dashboard
				</h1>
		<div class="btn-group-vertical">
				<hr>
				<a href="adminOrders.jsp" type="button" class="btn btn-default btn-lg">Change Orders Status</a>
				<hr>
				<a href="" type="button" class="btn btn-default btn-lg">Add new Dish to Menus</a>
				<hr>
				<a href="" type="button" class="btn btn-default btn-lg">Remove a Dish from Menus</a>
				<hr>
				<a href="" type="button" class="btn btn-default btn-lg">Edit a Dish from Menus</a>
				<hr>
				
				</div>
				
				<div class="row">
				<div class="col-md-12">
					<a href="" class="btn btn-warning btn-lg pull-right">Logout</a>
				</div>
			</div>
			</div>
		</div>

<!-- Footer Tags -->
	<t:footer></t:footer>
</body>
</html>