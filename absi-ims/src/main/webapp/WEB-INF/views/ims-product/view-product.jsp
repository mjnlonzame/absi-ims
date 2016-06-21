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

<form:form id="imsProduct" modelAttribute="imsProduct" action="${pageContext.servletContext.contextPath}/delete" method="DELETE">
		
		<form:hidden path="id"/>
		<%-- <c:out value="${imsOutlet.id}"/> --%>
</form:form>			

<div class="form-user">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
				<ul>
					<li><label><strong> Supplier       :</strong></label><span><c:out value="${imsProduct.client.name}"/></span></li>	
<%--                     <li><label><strong> Supplier           : </strong></label><span><c:out value="${imsProduct.clientId}"/></span></li> --%>
                    <li><label><strong> Product Categroy   :</strong></label><span><c:out value="${imsProduct.category}"/></span></li>
                    <li><label><strong> Product Name       : </strong></label><span><c:out value="${imsProduct.name}"/></span></li>
                    <li><label><strong> Unit Price         : </strong></label><span><c:out value="${imsProduct.price}"/></span></li>
                    <%-- <li><label><strong> SKU                :</strong></label><span><c:out value="${imsProduct.sku}"/></span></li> --%>
					<li>
						<label><strong> Product Description: </strong></label>
						<span> 
							<c:out value="${imsProduct.sku}, ${imsProduct.name}, ${imsProduct.weight}, ${imsProduct.price}"/>
						</span>
						</li>
					
				</ul>
		
	
</div>

</body>


