<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="search-options">
		<input type="text" class="field">
		<input type="button" value="Search" class="search-btn button">
		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-outlet/new'">
	</div>
	
	<table class="outlet-list">
	  <tr class="trhead">
		<td> Outlet Name </td>
	    <td> Contact Number </td>
		<td> Outlet Address </td>
	    <td> City </td>
		<td> Postal Code </td>
	    
	  </tr>
	  
		<c:forEach var="outlet" items="${imsOutletList}">
			
			<tr class="link"> 			
			
				<td>	
					<c:out value="${outlet.name}" />	
					
					<div class="hidden view-url">
						<c:url value="/ims-outlet/view/${outlet.id}" />
					
					</div>
				</td>
				
				<td>	
					<c:out value="${outlet.contactNumber}"		/>
				</td>
				
				<td>	
					<c:out value="${outlet.address}" />	
				</td>
				
				<td>	
					<c:out value="${outlet.city}"		/>	
				</td>
				
				<td>	
					<c:out value="${outlet.postalCode}" />	
				</td>
				
			</tr>
			
		</c:forEach>
	  
	</table>

<script type="text/javascript">
	$(function() {
		$(".link").click(function() {
			var url = $(this).find(".view-url").html();
			validNavigation = true;
						window.location = $.trim(url);
		});
	});
</script>