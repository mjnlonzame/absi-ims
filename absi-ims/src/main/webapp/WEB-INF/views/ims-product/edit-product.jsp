<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form id="imsProduct" modelAttribute="imsProduct" action="${pageContext.servletContext.contextPath}${action}" method="POST" cssClass="form-user">
				<ul>
	<%-- 					<li><label><strong> Outlet Store       :</strong></label><form:input type="text" path="" /></li>	 --%>
	<%--                     <li><label><strong> Supplier           : </strong></label><form:input type="text" path="username" /></li>	 --%>
					<li><label><strong> Outlet Store </strong></label>:
						<form:select path="client.id">
					      <c:forEach items="${clients}" var="outletObj">
					            <option value="${outletObj.id}" ${outletObj.id == selectedClient ? 'selected="selected"' : ""}>${outletObj.name}</option> 
					        </c:forEach>
					    </form:select> 
					</li>
<!-- 					<li><label><strong> Supplier </strong></label>: -->
<%-- 						<form:select path="clientId"> --%>
<%--                                 <option value="${imsProduct.clientId}"> wew </option> --%>
<!-- 								<option value="1"> Century </option> -->
<!--                                 <option value="2"> Biolinks </option> -->
<%--                         </form:select> --%>
<!-- 					</li> -->
                    <li><label><strong> Product Categroy   :</strong></label><form:input type="text" path="category" /></li>	
                    <li><label><strong> Product Name       : </strong></label><form:input type="text" path="name" /></li>	
                    <li><label><strong> Unit Price         : </strong></label><form:input type="text" path="price" /></li>	
                    <li><label><strong> SKU                :</strong></label><form:input type="text" path="sku" /></li>	
                    <li><label><strong> Weight </strong></label>:<form:input type="text" path="weight"/></li>	
<%-- 					<li>
						<label><strong> Product Description </strong></label>: 
						<form:textarea class="form-control" rows="4" path="description"></form:textarea>
					</li> --%>
					<form:hidden path="id" />
					
				</ul>
		
</form:form>

<script type="text/javascript">
$(document).ready(function(){
	hideButtons();
});
function hideButtons(){

	$("#btnEdit").hide();
	$("#btnDelete").hide();
	$("#btnAdd").hide();
}


$("#btnSubmit").on('click', function(){
	saveNewProduct();
});

$("#btnCancel").on('click', function(){
	location.href='${pageContext.request.contextPath}/ims-product';
});

function saveNewProduct()
{
	document.getElementById("imsProduct").submit();
	alert ("Data has been updated");
}
</script>