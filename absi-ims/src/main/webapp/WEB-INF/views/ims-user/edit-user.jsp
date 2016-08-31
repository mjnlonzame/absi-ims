<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form id="imsUser" modelAttribute="imsUser" action="${pageContext.servletContext.contextPath}${action}" method="POST" cssClass="form-user">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
<%-- 		<div class="hidden edit-url">
			<c:url value="/ims-user/update/${imsUser.id}" />		
		</div> --%>
		
		<ul>
				<li><label><strong> User Type </strong></label>:<form:select
					path="userType">
					<option></option>
					<option value="ROLE_ADMIN">Admin</option>
					<option value="ROLE_COORDINATOR">Coordinator</option>
					<option value="ROLE_ENCODER">Encoder</option>
					<option value="ROLE_CLIENT">Client</option>
				</form:select></li>	
				<li><label><strong> Username </strong></label>:<form:input
						type="text" path="username" /></li>
				<li><label><strong> Password </strong></label>:<form:input
						type="password" path="password" /></li>
				<li><label><strong> First Name </strong></label>:<form:input
						type="text" path="firstname" /></li>
				<li><label><strong> Middle Name </strong></label>:<form:input
						type="text" path="middlename" /></li>
				<li><label><strong> Last Name </strong></label>:<form:input
						type="text" path="lastname" /></li>
				<li><label><strong> Contact Number </strong></label>:<form:input
					type="text" path="contactNumber"/></li>			
				<li><label><strong> E-mail Address </strong></label>:<form:input
						type="text" path="emailAddress" /></li>
				<li><label><strong> Address </strong></label>:<form:input
						type="text" path="address" /></li>
<%-- 				<li><label><strong> City </strong></label>:<form:input --%>
		<%-- 						type="text" path="city" /></li> --%>
				<li><label><strong> City </strong></label>:<form:select id="city"
						class="required" path="city">
						<option value="">--SELECT--</option>
						<option value="Manila">Manila</option>
						<option value="Caloocan">Caloocan</option>
						<option value="Las Piñas">Las Piñas</option>
						<option value="Makati">Makati</option>
						<option value="Malabon">Malabon</option>
						<option value="Mandaluyong">Mandaluyong</option>
						<option value="Marikina">Marikina</option>
						<option value="Muntinlupa">Muntinlupa</option>
						<option value="Makati">Makati</option>
						<option value="Parañaque">Parañaque</option>
						<option value="Pasay">Pasay</option>
						<option value="Pasig">Pasig</option>
						<option value="Quezon City">Quezon City</option>
						<option value="San Juan">San Juan</option>
						<option value="Taguig">Taguig</option>
						<option value="Valenzuela">Valenzuela</option>
					</form:select></li>
				<li><label><strong> Postal Code </strong></label>:<form:input
						type="text" path="postalCode" /></li>

				<form:hidden path="id" />
				<form:hidden path="version" />
				
					
		
			
		</ul>
		
		
</form:form>

<script type="text/javascript">
$(document).ready(function(){
	console.log("city is ", $(imsUser.city));
	hideButtons();
});
function hideButtons(){

	$("#btnEdit").hide();
	$("#btnDelete").hide();
	$("#btnAdd").hide();
	$("#btnView").hide();
}


$("#btnSubmit").on('click', function(){
	saveNewUser();
});

$("#btnCancel").on('click', function(){
	location.href='${pageContext.request.contextPath}/ims-user';
});


function saveNewUser()
{
	document.getElementById("imsUser").submit();
	alert ("Data has been updated");
}

/* 	$(function() {
		$(".link").click(function() {
			var url = $(this).find(".edit-url").html();
			validNavigation = true;
						window.location = $.trim(url);
		});
	}); */
</script>