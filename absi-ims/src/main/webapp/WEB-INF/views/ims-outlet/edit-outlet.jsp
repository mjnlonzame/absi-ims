<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form id="imsOutlet" modelAttribute="imsOutlet" action="${pageContext.servletContext.contextPath}${action}" method="POST" cssClass="form-outlet">
<%-- 		<form:hidden path="id"/>
		<c:out value="${imsUser.id}"/>
		 --%>
		<ul>

			<li><label><strong> Supplier </strong></label>: 
				<form:select
					path="clients" >
					<c:forEach items="${clients}" var="outletObj">
						<option value="${outletObj.id}" ${ selectedClients.contains(outletObj.id) ? 'selected="selected"' : ''}>${outletObj.name}</option>
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
			<form:hidden path="id" />
			<form:hidden path="version" />
		</ul>

</form:form>


<script type="text/javascript">	

$('option').mousedown(function(e) {
    e.preventDefault();
    $(this).prop('selected', !$(this).prop('selected'));
    return false;
});

$(document).ready(function(){
	hideButtons();
});
function hideButtons(){

	$("#btnEdit").hide();
	$("#btnDelete").hide();
	$("#btnAdd").hide();
	$("#btnView").hide();
}


$("#btnSubmit").on('click', function(){
	saveNewOutlet();
});

$("#btnCancel").on('click', function(){
	location.href='${pageContext.request.contextPath}/ims-outlet';
});

function saveNewOutlet()
{
	document.getElementById("imsOutlet").submit();
	alert ("Data has been updated");
}

</script>