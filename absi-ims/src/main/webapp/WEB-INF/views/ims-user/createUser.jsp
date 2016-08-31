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


	
	<form:form id="imsUser" modelAttribute="imsUser" action="${pageContext.servletContext.contextPath}${action}" method="POST" cssClass="form-user">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<ul>
			<li><label><strong> User Type </strong></label>:<form:select
					id="userType" path="userType">
<!-- 					<option></option> --> 	
					<option value="ROLE_ADMIN">Admin</option>
					<option value="ROLE_ENCODER">Encoder</option>
					<option value="ROLE_CLIENT">Client</option>
				</form:select></li>
			<li><label><strong> Usernameee </strong></label>:<form:input
					type="text"  class="required" path="username" readonly="true" /></li>
<%-- 			<li><label><strong> Password </strong></label>:<form:input --%>
<%-- 					type="text" class="required" path="password" /></li> --%>
			<li><label id="firstNameLabel"><strong> First Name </strong></label>:<form:input
					type="text" class="required" id="firstname" path="firstname" /></li>
			<div id="person"> 	
				<li><label><strong> Middle Name </strong></label>:<form:input
						type="text" class="required" path="middlename" /></li>
				<li><label><strong> Last Name </strong></label>:<form:input
						type="text" class="required" id="lastname" path="lastname" /></li>
			</div>

			<li><label><strong> Contact Number </strong></label>:<form:input
				type="text" class="required" path="contactNumber"/></li>			
			<li><label><strong> E-mail Address </strong></label>:<form:input
					type="text" maxlength="40" class="required" path="emailAddress" /></li>
			<li><label><strong> Address </strong></label>:<form:input
					type="text" maxlength="250" class="required" path="address" /></li>
			<li><label><strong> City </strong></label>:<form:input
					type="text" class="required" path="city" /></li>
			<li><label><strong> Postal Code </strong></label>:<form:input
					type="number" class="required" path="postalCode" /></li>
		</ul>
	</form:form>
	
	

</body>
</html>


<script type="text/javascript">

function saveNewUser()
{
	console.log("try");
// 	checkUsernameFormat();
	if(isFormValid()){
		document.getElementById("imsUser").submit();
		alert ("Data has been updated");
	} else {
		alert("Please complete required fields!");
	}

}

$("#firstname, #lastname").on('change', function(){
	
	var firstname	 = ($("#firstname").val()).substr(0,2); 	
	var lastname = $("#lastname").val();
	
	var fullname = firstname + lastname;
	console.log("full name is", fullname);
	$("#username").val("");	
	$("#username").val( fullname);	
});
function isUsernameFormatValid(){
	var username = $("#username").val();
	var lastname = $("#lastname").val();
	var firstname	 = ($("#firstname").val()).substr(0,1);
	var expectedUsername = firstname + lastname;
	console.log("expectedUsername: ",expectedUsername);	 
	if(username === expectedUsername){
		$("#username").removeClass("with-error")
		return true;
	} else {
		$("#username").addClass("with-error")
		return false;
	}
}
$("#userType").on('change', function(){
	var userType = $(this).val();
	console.log("user type is s", userType);
	if(userType === 'ROLE_CLIENT'){
// 		$("#middlename").hide();
		$("#person").hide();
		$("#lastname").val("");
		$("#middlename").val("");
		$("#middlename").removeClass("required");
		$("#lastname").removeClass("required");
		$("#firstNameLabel").text("Client Name");	
	} else{
// 		$("#middlename").show();
		$("#person").show();
		$("#lastname").addClass("required");
		$("#middlename").addClass("required");
		$("#firstNameLabel").text("First Name");
	}
});

	 		
// function isFormValid(){
// 	$(".required").each(function(index){
// 		if($(this).val().trim() === ""){
// 			$(this).addClass("with-error");
// 		} else {
// 			$(this).removeClass("with-error");
// 		}
// 	});

// // 	if*
// // 	console.log($(".required").hasClass("with-error"));
	
// 	return  !($(".required").hasClass("with-error"));
// }
$("#btnSubmit").on('click', function(){
	saveNewUser();
});

$("#btnCancel").on('click', function(){
	location.href='${pageContext.request.contextPath}/ims-user';
});

// $(".required").focusout(function(){
// // 	console.log("this is ",$(this));
// 	if($(this).val().trim() === ""){
// 		$(this).addClass("with-error");
// 	} else {
// 		$(this).removeClass("with-error");
// 	}
// });

// var $j = jQuery.noConflict();

$(document).ready(function () {
	
// 	$j('#birthDate-dp').datepicker({
	
// 	locale: {
// 		format: "dd/mm/yyyy"
	
// 			}
// 	});  
	
	hideButtons();

});


function hideButtons(){

	$("#btnEdit").hide();
	$("#btnDelete").hide();
	$("#btnAdd").hide();
}


</script>

