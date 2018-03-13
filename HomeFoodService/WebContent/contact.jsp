<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Html tags -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!-- Internationalization -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.homefood.languageResources.text" />
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="index.title" /></title>

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
<div class="container container-style">

<!-- Display Error messages -->
		<% if(request.getAttribute("errorMessage") != null) { %>
		<div class="alert alert-danger" role="alert">${errorMessage}</div>
		<% } %>
	<!-- Display Success messages -->
		<% if(request.getAttribute("successMessage") != null) { %>
		<div class="alert alert-success" role="alert">${successMessage}</div>
		<% } %>
			
<h1 style="color:red;"><fmt:message key="contact.title" /></h1>
	<hr>
<form action="EmailSendingServlet" method="post">

	  <div class="form-group">
	    <label for="email"><fmt:message key="contact.email" /></label>
	    <input type="email" name="email" class="form-control" placeholder="<fmt:message key="contact.email.placeholder" />" required>
	  </div>
	  	  <div class="form-group">
	    <label for="firstname"><fmt:message key="contact.name" /></label>
	    <input type="text" name="name" placeholder="<fmt:message key="contact.name.placeholder"/> " class="form-control""required>
	  </div>
	  
	  <div class="form-group">
	    <textarea cols="50"  rows="15" id="about-project" name="message" placeholder="<fmt:message key="contact.message.placeholder"/>"></textarea>
	  </div> 
	  <button type="submit" id="send-message" class="btn btn-default"><fmt:message key="contact.button.send" /></button>
	</form>
	</div>	
	
	<!-- Footer Tags -->
	<t:footer></t:footer>
</body>
</html>