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
<title><fmt:message key="register.title" /></title>

<!-- Style Links -->
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.4/style/style.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="bootstrap-3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap-theme.min.css">
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

<div class="container container-style">

	<!-- Display Error messages -->
	<% if(request.getAttribute("errorMessage") != null) { %>
	<div class="alert alert-danger" role="alert">${errorMessage}</div>
	<% } %>
		
	<h1 style="color:red;"><fmt:message key="register.title" /></h1>
	<hr>
	<h3><fmt:message key="register.information" /></h3>
	<form action="register" method="post" id="register_form">
	  <div class="form-group">
	    <label for="firstname"><fmt:message key="register.firstName" /></label>
	    <input name="firstname" class="form-control" id="firstname" placeholder="<fmt:message key="register.firstName.placeholder" />">
	  </div>
	  <div class="form-group">
	    <label for="lastname"><fmt:message key="register.lastName" /></label>
	    <input name="lastname" class="form-control" id="lastname" placeholder="<fmt:message key="register.lastName.placeholder" />">
	  </div>
	  <div class="form-group">
	    <label for="email"><fmt:message key="register.email" /></label>
	    <input name="email" class="form-control" id="email" placeholder="<fmt:message key="register.email.placeholder" />">
	  </div>
	  <div class="form-group">
	    <label for="password"><fmt:message key="register.password" /></label>
	    <input type="password" name="password" class="form-control" id="password" placeholder="<fmt:message key="register.password.placeholder" />">
	  </div>
	  <div class="form-group">
	    <label for="password_confirm"><fmt:message key="register.password2" /></label>
	    <input type="password" name="password_confirm" class="form-control" id="password_confirm" placeholder="<fmt:message key="register.password2.placeholder" />" required>
	  </div>
	  <div class="form-group">
	    <label for="phone"><fmt:message key="register.phone" /></label>
	    <input name="phone" class="form-control" id="phone" placeholder="<fmt:message key="register.phone.placeholder" />">
	  </div> 
	  <div class="checkbox">
	    <label>
	      <input type="checkbox" name="subscribed" value="subscribe"> <fmt:message key="register.subscribe" />
	    </label>
	  </div>
	  <button style="margin-left:auto;margin-right:auto;display:block;margin-top:0%;margin-bottom:0%" type="submit" class="btn btn-default"><fmt:message key="register.button" /></button>
	</form>
</div>

<!-- Footer Tags -->
<t:footer></t:footer>
</body>
</html>