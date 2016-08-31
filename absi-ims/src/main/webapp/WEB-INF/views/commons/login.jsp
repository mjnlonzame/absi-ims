<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">

<head>
    <title>Login - ABS Promotions Corporations</title>
    
    <meta name="description" content="Login Page">
	<meta name="viewport" content="width=device-width, initial-scale=1">    

	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/login.css" /> ">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/utility.css" /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" /> ">

</head>

<body>

    <div class="login-card">
		<div class="login-card">
	    		<h1> ABS Inventory </h1> <br>
	    		<form action="<c:url value="/login" />" method="post">
	    			<input type="text" name="username" placeholder="Username">
	    			<input type="password" name="password" placeholder="Password">
	    			<sec:csrfInput/>
	    			<c:if test="${param.error != null }">
	    				<p> Invalid Username and Password!</p>
	    			</c:if>
	    			<input type="submit" name="login" class="login login-submit" value="login">
	    		</form>
	        
<!-- 	    		<div class="login-help">
	    			<a href="#">Forgot Password</a>
	    		</div> -->
	    </div>		
		
	</div>
 
</body>
</html>
<script type="text/javascript">

$(document).ready(function(){	
	hideButtons();
});


function hideButtons(){
	$("#btnCancel").hide();
	$("#btnSubmit").hide();
	$("#btnEdit").hide();
	$("#btnDelete").hide();
	$("#btnAdd").hide();
	$("#btnView").hide();
	$("#logoutHeader").hide();
}


</script>