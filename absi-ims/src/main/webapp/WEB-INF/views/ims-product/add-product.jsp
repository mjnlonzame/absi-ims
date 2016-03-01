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


</head>

<body>
	<form:form id="imsProduct" modelAttribute="imsProduct" action="${pageContext.servletContext.contextPath}${action}" method="POST" cssClass="form-product">
			<ul>
					
					<li><label><strong>Client</strong></label>:
						<form:select path="client.id">
						    <form:option value="NONE"> --SELECT--</form:option>
					      <c:forEach items="${clients}" var="clientObj">
					            <option value="${clientObj.id}">${clientObj.name}</option> 
					        </c:forEach>
					    </form:select>
					</li>
					
					
					
					<li><label><strong> Product Category </strong></label>:<form:select path="category" >
					                                <option>  </option>
													<option> Shampoo </option>
					                                <option> Soap </option>
					                                <option> Conditioner </option>
													<option> Facial Wash </option>
					                              </form:select>
					</li>
					
					
					<li><label><strong> Product Name </strong></label>:<form:input type="text" path="name"/></li>
					<li><label><strong> Unit Price </strong></label>:<form:input type="text" path="price"/></li>
					<li><label><strong> SKU </strong></label>:<form:input type="text" path="sku"/></li>
					<li><label><strong> Weight </strong></label>:<form:input type="text" path="weight"/></li>			
<!-- 					<li> -->
<!-- 						<label><strong> Product Description </strong></label>:  -->
<%-- 						<form:textarea class="form-control" rows="4" path="description"></form:textarea> --%>
					
<!-- 					</li> -->
			
					
			          </ul>
	</form:form>
</body>
</html>


<script type="text/javascript">

function saveNewProduct()
{
	document.getElementById("imsProduct").submit();
	alert ("Data has been updated");
}

</script>