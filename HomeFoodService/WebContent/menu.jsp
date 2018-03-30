<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page import="com.homefood.beans.ProductBean"%>
<%@ page import="com.homefood.util.MenuDAO"%>
<%@ page import="java.util.ArrayList"%>

<!-- Html tags -->
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<!-- Internationalization -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<c:set var="language2" value="${language}"/>	
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.homefood.languageResources.text" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu</title>

<!-- Style Links -->
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.4/style/style.css">
<script src="js/jquery-1.11.2.min.js"></script>
<script src="bootstrap-3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.4/css/bootstrap-theme.min.css">
<script src="bootstrap-3.3.4/js/scripts.js"></script>

<script>
	$(document).ready(listCart());

	$(document).ready(function() {
		$('.addToCart').click(function(event) {
			var id = event.target.id;
			addToCart(id);
		});
	});

	$(document).ready(function() {
		$('#itemList').on('click', '.removeFromCart', function(event) {
			var id = event.target.id;
			removeFromCart(id);
		});
	});

	$(document).ready(function() {

		$('#showLoginModal').click(function(event) {
			$('#loginModal').modal('show');
		});

		$('#openRegistration').click(function(event) {
			$('.modal-login').css('display', 'none');
			$('.modal-register').css('display', 'block');
		});
		
		setTimeout(function(){
			var divs = $('.tablinks');
			divs[0].click();
			}, 500);
	});
</script>
<script>
	function openMenu(evt, selMenu) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(selMenu).style.display = "block";
	    evt.currentTarget.className += " active";
	}
</script>
</head>
<body>

<!-- Header Tags -->
	<t:header></t:header>
	<div class="container container-style">
		<div class="row">
				<div class="menu col-xs-12 col-md-8">
				<div class="row"> 	
			<%
					//Get the menu Category like Italian or Greek
					String category = "";
				    String actMenu = "";
				    String itemName="";
					ArrayList<ProductBean> menu = 
							MenuDAO.listMenu(pageContext.getAttribute("language2").toString().split("_")[0]);
					
					out.println("<div class=\"tab\">");
					for (ProductBean product : menu) {
						if (!product.getCategory().equals(category)) {
							category = product.getCategory();
							actMenu = category + "_menu";
							out.println("<button class=\"tablinks\" onclick=\"openMenu(event,'" + 
									actMenu + "')\" id=\"" + category +"\"> <h2>" + category + "</h2></button>");
						}
					}
					out.println("</div>"); //end tab div
	
					// load the Menu dishes 
					category="";
					
					for (ProductBean item : menu) {
						//start a new Div for every item list
						if (!category.equals(item.getCategory())) {
							out.println("</div>");
							category = item.getCategory();
							actMenu = category + "_menu";
							out.println("<div id=\""+actMenu+"\" class=\"row tabcontent\">");
						}
						//check if we alrady printed the item
						if(itemName.equals(item.getName())) continue;
						
						itemName = item.getName();
						
						//food item cell/block
						out.println("<div class=\"col-xs-12 col-md-6\">");
						out.println("  <div class=\"thumbnail\">");
						out.println("    <div>");
						out.println("      <div id=\"productName"+item.getId()+"\" class=\"productname\">");
						out.println("        <img src=\""+item.getImage()+"\"/>");
						out.println("        <strong>"+item.getName()+"</strong>"); 
						out.println("      </div>");
						out.println("      <i>"+item.getDescription()+"</i><br/>"+item.getIngredients());
						out.println("    </div>");
				
						//print all the size prices for the item
						out.println("    <div class=\"price-add\">");
						for (ProductBean price : menu) {
							if(itemName.equals(price.getName())) {
							   	
								  out.println("      <div class=\"add\">");
								    out.println("        <button id=\""+price.getId()+"\" class=\"addToCart btn btn-default btn-md pull-right\">");
								    out.println("          $"+ price.getPriceOut() + " (" + price.getSize()+") +");
								    out.println("        </button>");
								    out.println("      </div>");
								    out.println("<div class=\"price\">");
									out.println("<span id=\"productPrice"+ price.getId()+"\" class=\""+price.getPriceOut()+"\"/>");
									out.println("</div>");
							}
						}
						
					    //Need this to adjust the price button
					    out.println("    <div class=\"clearfix\"></div>");
					    out.println("    </div>");				    
					    out.println("</div></div>");
					}
				%>				
					</div>
			</div>
			
			<div class="cart vert-menu-style col-xs-6 col-md-4">
				<div class="myitems panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title"><fmt:message key="menu.myOrders" /></h3>
					</div>
					<div class="items col-xs-12">
						<ul id="itemList">
						</ul>
					</div>
					<div class="col-xs-12">
						<div class="totalprice pull-right"></div>
					</div>
					<div class="col-xs-12">
						<!--style="visibility:hidden-->
						<%
							if (session.getAttribute("id") == null) {
						%>
						<button class="btn btn-block btn-default placeOrder"
							id="showLoginModal"><fmt:message key="menu.checkout" /></button>
						<%
							} else {
						%>
						<a href="checkout.jsp"
							class="btn btn-block btn-default placeOrder">Checkout</a>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<fmt:message key="login.title" />
					</h4>
				</div>
				<div class="modal-body">

					<div class="modal-login">
						<form action="login" method="post" id="loginform">
							<div class="form-group">
								<label for="email"><fmt:message key="login.email" /></label>
								<input name="email" class="form-control" id="email">
							</div>
							<div class="form-group">
								<label for="password"><fmt:message
										key="login.password" /></label> <input type="password"
									name="password" class="form-control" id="password">
							</div>
							<input type="hidden" name="origin" value="menu">
							<button type="submit" class="btn btn-primary pull-right">Login</button>
						</form>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="modal-footer">

					<div class="register pull-left">
						Not registered yet? <a href="register.jsp">Sign up</a>
					</div>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<!-- Footer Tags -->
	<t:footer></t:footer>
</body>
</html>