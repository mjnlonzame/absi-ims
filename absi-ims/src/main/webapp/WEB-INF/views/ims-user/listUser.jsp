<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--     <div class="search-options"> -->
<%-- 		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-user/new'"> --%>
<!-- 	</div> -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table id="userTable" class="user-list">
		
	<thead class="trhead">
		<td>User Type</td>
		<td>Name</td>
		<td>Username</td>
		<td>Contact Number</td>

	</thead>

<%-- 	<c:forEach var="user" items="${imsUserList}"> --%>
			
<!-- 			<tr class="link"> 			 -->
<!-- 				<td>Employee</td> -->
				
<!-- 				<td>	 -->
<%-- 					<c:out value="${user.lastname} , ${user.firstname} , ${user.middlename}" />	 --%>
					
<!-- 					<div class="hidden view-url"> -->
<%-- 						<c:url value="/ims-user/view/${user.id}" /> --%>
<!-- 					</div> -->
<!-- 				</td> -->
				
<!-- 				<td>	 -->
<%-- 					<c:out value="${user.username}" />	 --%>
<!-- 				</td> -->
				
<!-- 				<td>	 -->
<%-- 					<c:out value="${user.password}"		/>	 --%>
<!-- 				</td> -->
				
<!-- 				<td>	 -->
<%-- 					<c:out value="${user.contactNumber}" />	 --%>
<!-- 				</td> -->
				
<!-- 			</tr> -->
			
<%-- 		</c:forEach> --%>
	  
	</table>

<script type="text/javascript">
	$(function() {
		$(".link").click(function() {
			var url = $(this).find(".view-url").html();
			validNavigation = true;
						window.location = $.trim(url);
		});
		hideButtons();
		retrieveUsers();
	});
	
	$("#btnEdit").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-user/edit?usrId=' + oTable.rows('.selected').data()[0].id;
	});
	
	function hideButtons(){
		$("#btnCancel").hide();
		$("#btnSubmit").hide();
		
	}
	$("#btnAdd").on("click", function(){
		 location.href='${pageContext.request.contextPath}/ims-user/new';
	});
	
	$("#btnDelete").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-user/delete?usrId=' + oTable.rows('.selected').data()[0].id;
	});
	
	$("#btnView").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-user/view/' + oTable.rows('.selected').data()[0].id;
	});


			
	
	$('#userTable').on('click', 'tr', function () {
		$("tr").removeClass('selected');
        $(this).toggleClass('selected');
    } );
	
	
	
	function retrieveUsers(){
		 $.post('/absi-ims/ims-user/retrieveUsers', {} , function(data) {
				 	console.log(data);		 	
				 	var users = data;
				 	constructDataTable(users);
			 }, 'json');
	}
	
	
	function constructDataTable(users){			  
		oTable = $("#userTable").DataTable({
			  "aaData": users,
			  "aoColumnDefs":[{
			        "sTitle":"User Type",
			       "data":  "userType",
			       "targets" : [0]
			  },
			  {
			        "sTitle":"Name",
			       "data":  "firstname",
			       "targets" : [1]
			  },
			  {
			        "sTitle":"Username",
					"data":  "username",
					"targets" : [2]
			  
			  },
			  {
			        "sTitle":"Contact Number",
			       "data": "contactNumber", 
			       "targets" : [3]
			  }
// 			  },
// 			  {
// 			        "sTitle":"Postal Code",
// 			       "data": "postalCode",
// 			       "targets" : [4]
// 			  }

			  ]
			});
	}
</script>

