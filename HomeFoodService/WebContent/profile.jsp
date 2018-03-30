<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%
	//Check if user is already logged in. If yes, redirect to Home page.
	if(session.getAttribute("id") == null) response.sendRedirect("login.jsp");
%>


<%@ page import="java.util.ArrayList"%>

<!-- Internationalization imports -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.homefood.languageResources.text" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Style Links -->
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.4/style/style.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="bootstrap-3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap-theme.min.css">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="profile.userProfile" /></title>
<script src="js/jquery.validate.min.js"> </script>
<script src="js/register-form-validation.js"> </script>
<c:set var="locale" value="${language}"/>
<c:if test="${locale == 'fr'}">
    <script src="js/messages_fr.js" type="text/javascript"> </script>
</c:if> 
<script>
$(document).ready(function(){
	$("#profileForm").css('display', 'block');
	$(".showContent").click(function(event){
		var id = event.target.id;
		if(id == "profile"){
			$("#profileForm").css('display', 'block');
			$("#pwdForm").css('display', 'none');
		}
		if(id == "password"){
			$("#profileForm").css('display', 'none');
			$("#pwdForm").css('display', 'block');
		}
	});
});

</script>

 <c:set var="locale" value="${language}"/>
    <c:if test="${locale == 'fr'}">
        <script src="js/messages_fr.js" type="text/javascript"> </script>
    </c:if> 
</head>
<body>

<t:header></t:header>		
<div class="container container-style">

<!-- Display Error messages -->
	<% if(request.getAttribute("errorMessage") != null) { %>
	<div class="alert alert-danger" role="alert">${errorMessage}</div>
	<% } %>
	
    <div class="row">
        <div class="col-md-3 profile-menu vert-menu-style panel panel-warning">
        	<div class="panel-heading">
				<h3 class="panel-title"><fmt:message key="profile.myProfile" /></h3>
			</div>
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#" class="showContent" id="profile"><fmt:message key="profile.updateProfile" /></a></li>
                <li><a href="#" class="showContent" id="password" ><fmt:message key="profile.changePassword" /></a></li>
            </ul>
        </div>

        <div style="display:none" id="profileForm" class="col-md-9">
        	<h3><fmt:message key="profile.updateProfile" /></h3>
        	
        	<!--------------- Edit profile form --------------->
				<form action="profileChange" id="change_profile" method="post">
					<div class="form-group">
						<label for="firstname"><fmt:message key="profile.firstName" /></label> <input name="firstname"
							class="form-control" id="firstname"
							value="">
					</div>
					<div class="form-group">
						<label for="lastname"><fmt:message key="profile.lastName" /></label> <input name="lastname"
							class="form-control" id="lastname"
							value="">
					</div>
					<div class="form-group">
						<label for="email"><fmt:message key="profile.email" /></label> <input name="email"
							class="form-control" id="email" value="">
					</div>
					<div class="form-group">
						<label for="phone"><fmt:message key="profile.phone" /></label> <input name="phone"
							class="form-control" id="profile_phone"
							value="">
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" name="subscribed"
							value="subscribe" checked> <fmt:message key="profile.subscribed" />
						</label>
						<input name= "control" type="hidden" value="profile">
					</div>
					
					<button type="submit" class="btn btn-warning pull-right"><fmt:message key="profile.updateProfile" /></button>
				</form>

			</div > 
			<!--------------- End profile form --------------->
			
        <div style="display:none" id="pwdForm" class="col-md-9" >
        <h3><fmt:message key="profile.changePassword" /></h3>
        
        <!--------------- Edit password form --------------->
				<form action="pwdChange" id="pwdChange" method="post">
					<div class="form-group">
						<label for="password"><fmt:message key="profile.password" /></label> 
						<input type="password" name="password" class="form-control" id="password" placeholder="<fmt:message key="profile.enterPassword" />" required >
					</div>
					<div class="form-group">
						<label for="password-conf"><fmt:message key="profile.confPassword" /></label> 
						<input type="password" name="password_again" class="form-control" id="password_again" placeholder="<fmt:message key="profile.confPassword"/>" required>
						<input name= "control" type="hidden" value="pwd">
					</div>
					<button type="submit" class="btn btn-warning pull-right"><fmt:message key="profile.change" /></button>				
				</form>
			</div>   
        <!--------------- End password form --------------->			
    </div>
</div>

<t:footer></t:footer>
</body>
</html>
