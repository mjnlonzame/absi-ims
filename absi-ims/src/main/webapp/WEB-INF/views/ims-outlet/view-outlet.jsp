<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<head>

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/utility.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" /> ">

</head>


<body>

		<div class="form-outlet">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			<ul>
				<c:out value="${action}"/>
				
				<li><label><strong> Outlet Name     :</strong></label><span>
				<c:out value= "${imsOutlet.name}"/></span></li>	
				
				<li><label><strong> Contact Number     :</strong></label><span>
				<c:out value= "${imsOutlet.contactNumber}" /></span></li>
				
				<li><label><strong> Address     :</strong></label><span>
				<c:out value= "${imsOutlet.address}" /></span></li>
				
				<li><label><strong> City     :</strong></label><span>
				<c:out value= "${imsOutlet.city}"/></span></li>
				
				<li><label><strong> Postal Code     :</strong></label><span>
				<c:out value="${imsOutlet.postalCode}" /></span></li>
				
			</ul>
		</div>	


</body>
<script type="text/javascript">
$(document).ready(function(){
	hideButtons();
});

$("#btnCancel").on('click', function(){
	location.href='${pageContext.request.contextPath}/ims-outlet';
});

function hideButtons(){

	$("#btnEdit").hide();
	$("#btnDelete").hide();
	$("#btnAdd").hide();
	$("#btnSubmit").hide();
}


</script>