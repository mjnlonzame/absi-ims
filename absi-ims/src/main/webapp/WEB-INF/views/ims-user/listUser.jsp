<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="search-options">
		<input type="text" class="field">
		<input type="button" value="Search" class="search-btn button">
		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-user/new'">
	</div>
	
	<table class="user-list">
	  <tr class="trhead">
		<td> User Type </td>
	    <td> Name </td>
	    <td> Username  </td>
	    <td> Password  </td>
	    <td> Contact Number </td>
	    
	  </tr>
	  
		<c:forEach var="user" items="${imsUserList}">
			
			<tr class="link"> 			
				<td>Employee</td>
				
				<td>	
					<c:out value="${user.lastname} , ${user.firstname} , ${user.middlename}" />	
					
					<div class="hidden view-url">
						<c:url value="/ims-user/view/${user.id}" />
					</div>
				</td>
				
				<td>	
					<c:out value="${user.username}" />	
				</td>
				
				<td>	
					<c:out value="${user.password}"		/>	
				</td>
				
				<td>	
					<c:out value="${user.contactNumber}" />	
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

