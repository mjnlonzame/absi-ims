<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="search-options">
		<input type="text" class="field">
		<input type="button" value="Search" class="search-btn button">
		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-inventory/new'">
	</div>
	<ul>
		<div class="select-inventory" >
			<li><label><strong> Inventory Type </strong></label> :<select
				id="type" onchange="checkValue(this.value)">
					<option>Daily</option>
					<option>Weekly</option>
			</select></li>

			<li id="weekly" style='display: none'><label><strong>
				From : </strong></label> <input id="startPeriod" type="date" /> &nbsp &nbsp <label><strong>
				To : </strong></label> <input id="endPeriod" type="date" />
			</li>
			<li id="daily"><label><strong> 
				Today : </strong></label> <input id="dailyPeriod" type="date" /></li>

			<li><label><strong> Client </strong></label>: 
				<select id="selectClient" >
				<option value="">--SELECT--
					</option>
					<c:forEach items="${clients}" var="clientObj">
						<option value="${clientObj.id}">${clientObj.name}</option>
					</c:forEach> </select></li>

		</div>
	</ul>
	
	<table class="user-list">
	  <tr class="trhead">
		<td> User Type </td>
	    <td> Name </td>
	    <td> Username  </td>
	    <td> Password  </td>
	    <td> Contact Number </td>
	    
	  </tr>
	  
		<c:forEach var="inventory" items="${imsInventoryList}">
			
			<tr class="link"> 			
				<td>Employee</td>
				
<%-- 				<td>	
					<c:out value="${user.lastname} , ${user.firstname} , ${user.middlename}" />	
					
					<div class="hidden view-url">
						<c:url value="/ims-user/view/${user.id}" />
					</div>
				</td> --%>
				
				<td>	
					<c:out value="${inventory.period}" />	
				</td>
				
				<td>	
					<c:out value="${inventory.type}"		/>	
				</td>
				
				<td>	
					<c:out value="${inventory.amountOfftake}" />	
				</td>
				
			</tr>
			
		</c:forEach>
	  
	</table>

<script type="text/javascript">
function checkValue(val) {

	if (val === "Daily") {
		$("#startPeriod").val("");
		$("#endPeriod").val("");
		document.getElementById('daily').style.display = 'block';
		document.getElementById('weekly').style.display = 'none';
	} else {
		$("#dailyPeriod").val("");
		document.getElementById('daily').style.display = 'none';
		document.getElementById('weekly').style.display = 'block';
	}

}
</script>