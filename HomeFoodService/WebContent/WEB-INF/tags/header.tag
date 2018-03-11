<%@tag description="Header" pageEncoding="UTF-8"%>

<!-- Internationalization-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.homefood.languageResources.text" />

 <div class="header">
<nav class="navbar" style="background-color: black">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp"><font color="white"><b><fmt:message key="index.home" /></b></font></a></li>
				<li><a href="menu.jsp"><font color="white"><b><fmt:message key="index.menu" /></b></font></a></li>				
				<li><a href="about.jsp"><font color="white"><b><fmt:message key="index.about" /></b></font></a></li>
				<li><a href="contact.jsp"><font color="white"><b><fmt:message key="index.contact" /></b></font></a></li>
				<% if (session.getAttribute("id") != null) { %>
					<li>
						<a href="profile.jsp">
							<span class="glyphicon glyphicon-user"></span> 
							<font color="white"><b><%=session.getAttribute("firstname") %></b></font>
						</a>
					</li>
					<li>
						<a href="logout"><font color="white"><b><fmt:message key="index.logout" /></b></font></a>
					</li>
							
					<% } else {	%>
						<li> 
							<a href="login.jsp"><font color="white"><b><fmt:message key="index.login" /></b></font></a> 
						</li>
						<li>
							<a href="register.jsp"><font color="white"><b><fmt:message key="index.register" /></b></font></a>
						</li>
					<% } %>
					<li>
						<c:if test="${language.toString().split('_')[0].equals(\"en\") }">
							<a href="?language=fr"><font color="white"><b>French</b></font></a>
						</c:if>
						<c:if test="${language.toString().split('_')[0].equals(\"fr\")}">
							<a href="?language=en"><font color="white"><b>English</b></font></a>
						</c:if>
						<c:if test="${!language.toString().split('_')[0].equals(\"fr\") && !language.toString().split('_')[0].equals(\"en\")}">
							<a href="?language=en"><font color="white"><b>English</b></font></a>
						</c:if>
		        	</li>
		        	

				
			</ul>

		</div>
	</div>
</nav>
</div>