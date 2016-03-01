<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">

<head>
<title>Inventory ABS Promotions Corporations</title>

<meta name="description" content="Login Page">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/utility.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/datepicker.css" /> ">

<!--
<script src="<c:url value="/resources/js/lib/jquery/1.11.1/jquery.min.js" /> "> </script>
<script src="<c:url value="/resources/scripts/bootstrap-datepicker.js" /> "> </script>
-->




</head>

<body>
	
	<form:form id="imsOutlet" modelAttribute="imsOutlet" action="${pageContext.servletContext.contextPath}${action}" method="POST" cssClass="form-user">
		
		<ul>

			<li><label><strong> Supplier </strong></label>: 
				<form:select
					path="clients" >
					<c:forEach items="${clients}" var="outletObj">
						<option value="${outletObj.id}">${outletObj.name}</option>
					</c:forEach> 
				</form:select></li>
			<li><label><strong> Outlet Name </strong></label>:<form:input
					type="text" path="name" /></li>
			
			<li><label><strong> Contact Number </strong></label>:<form:input
					type="text" path="contactNumber" /></li>
			
			<li><label><strong> Address </strong></label>:<form:input
					type="text" path="address" /></li>
			
			<li><label><strong> City </strong></label>:<form:input
					type="text" path="city" /></li>
			
			<li><label><strong> Postal Code </strong></label>:<form:input
				type="text" path="postalCode"/></li>			
			
		</ul>
	</form:form>
	
	

</body>
</html>


<script type="text/javascript">

function saveNewOutlet()
{
	document.getElementById("imsOutlet").submit();
	alert ("New User has been saved!");
}
	
</script>