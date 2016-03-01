<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<style>
  		body {
		    font-family: "Arial Rounded MT Std","Arial Rounded MT Bold",Arial,Helvetica,sans-serif;
		}
  	</style>
  	<title>Content Not Found</title>     
  </head>
  <body>		
    <div style="text-align:center;">
	    <img src="${pageContext.servletContext.contextPath}/resources/images/404.jpeg" style="margin:7% auto 0 auto;"><br/>
	    <c:url value="/" var="homeUrl" />
	    <a href="${homeUrl}" style="text-decoration: none;" title="Navigate to Home">Home</a> | <a href="javascript:history.back()" style="text-decoration: none;" title="Go back to previous page">Back</a>
    </div>  
  </body>
</html>