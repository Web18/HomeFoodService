<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Html tags -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") != null) response.sendRedirect("index.jsp");
%>

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

<title><fmt:message key="login.title" /></title>

<!-- Style Links -->
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.4/style/style.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="bootstrap-3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap-theme.min.css">

</head>
<body>

<!-- Header Tags -->
<t:header></t:header>

<div class="container">
	<div class="container-fluid container-style">
	
		<% if(request.getAttribute("errorMessage") != null) { %>
		<div class="alert alert-danger" role="alert">${errorMessage}</div>
		<% } %>
		<% if(request.getAttribute("successMessage") != null) { %>
		<div class="alert alert-success" role="alert">${successMessage}</div>
		<% } %>
		
				<h1 style="color:red;">
					<fmt:message key="login.title" />
				</h1>
				<form action="login" id="loginform" method="post">
					<div class="form-group">
						<label for="email"><fmt:message key="login.email" /></label>
						<input name="email" class="form-control" id="email" placeholder="<fmt:message key="register.email.placeholder" />">
					</div>
					<div class="form-group">
						<label for="password"><fmt:message
								key="login.password" /></label> <input type="password"
							name="password" class="form-control" id="password" placeholder="<fmt:message key="register.password.placeholder" />">
					</div>
					<input type="hidden" name="origin" value="login">
					<button style="margin-left:auto;margin-right:auto;display:block;margin-top:0%;margin-bottom:0%" type="submit" class="btn btn-default">
						<fmt:message key="login.button" />
					</button>
				</form>

			</div>
		</div>

<!-- Footer Tags -->
	<t:footer></t:footer>
</body>
</html>