<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>Login - ABS Promotions Corporations</title>
    
    <meta name="description" content="Login Page">
	<meta name="viewport" content="width=device-width, initial-scale=1">    
	    
</head>

<body>

    <div class="login-card">
		
		<h1>ABS Promotions Inventory</h1><br>
			<form action="<c:url value="/login" />" method="post">
				<input type="text" name="user" placeholder="Username">
				<input type="password" name="pass" placeholder="Password">
				<input type="submit" name="login" class="login login-submit" value="Login">
			</form>
    
			<div class="login-help">
				&nbsp &nbsp <a href="#">Register</a>
			</div>
	</div>
 
</body>
</html>
