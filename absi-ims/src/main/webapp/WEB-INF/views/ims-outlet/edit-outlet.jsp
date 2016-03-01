<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form id="imsUser" modelAttribute="imsUser" action="${pageContext.servletContext.contextPath}${action}" method="GET" cssClass="form-user">
		<form:hidden path="id"/>
		<c:out value="${imsUser.id}"/>
		
		<ul>
					
				<li><label><strong> Username </strong></label>:<form:input
						type="text" path="username" /></li>
				<li><label><strong> Password </strong></label>:<form:input
						type="text" path="password" /></li>
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
				<li><label><strong> City </strong></label>:<form:input
						type="text" path="city" /></li>
				<li><label><strong> Postal Code </strong></label>:<form:input
						type="text" path="postalCode" /></li>
		
			
		</ul>
</form:form>