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

<div class="container">
	<div class="container welcomebox welcomebox-container-style">
	
	<!-- IF the user is already logged in -->
				<div class="text">
					<b><h1 style="color:red;"><fmt:message key="index.welcome" />
					<i>
					<%if (session.getAttribute("firstname") != null)
						out.println(session.getAttribute("firstname"));
					%> 
					</i>
					</h1></b>										
				</div>
			</div>
		</div>
	<br>
	<br>
	<div class="text-center">
	<a class="btn btn-default" style="width:200px;height:40px;" href="menu.jsp">
					<fmt:message key="index.link.makeanorder" /></a>
	</div>	
			
<!-- Footer Tags -->
<t:footer></t:footer>
</body>
</html>