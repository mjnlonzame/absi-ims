<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 	<div class="user-top-menu"> -->
<%-- 	<%-- 		<input type="button" id="btn-user-edit" value="Edit" class="btnHeader button" onclick="location.href='${pageContext.request.contextPath}/ims-user/edit?usrId=${imsUser.id}'"/>	 --%> 
<%-- <%-- 		<input type="button" id="btn-user-delete" value="Delete" class="btnHeader button" onclick="location.href='${pageContext.request.contextPath}/ims-user/delete?usrId=${imsUser.id}'"/>	 --%> 
	
<!-- 	</div> -->
    <div class="search-options">
    
<!-- 		<input type="text" class="field"> -->
<!-- 		<input type="button" value="Search" class="search-btn button"> -->
<%-- 		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-outlet/new'"> --%>
	</div>
<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  --%>
<%-- 	<c:set var="imsOutletList"  value="${imsOutletList}"/> --%>
	<table id="outletTable" class="outlet-list">
	<thead>
		<tr>
			<th>Outlet Name</th>
			<th>Contact Number</th>
			<th>Outlet Address</th>
			<th>City</th>
			<th>Postal Code</th>
		</tr>
	</thead>
	  
	</table>

<script type="text/javascript">

	$(document).ready(function(){

		hideButtons();	
		retrieveOutlets();
		
	});
	$("#btnEdit").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-outlet/edit/' + oTable.rows('.selected').data()[0].id;
	});
	
	function hideButtons(){
		$("#btnCancel").hide();
		$("#btnSubmit").hide();
		
	}
	
	
	$("#btnAdd").on("click", function(){
		 location.href='${pageContext.request.contextPath}/ims-outlet/new';
	});

	 
	$("#btnDelete").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-outlet/delete?outletId=' + oTable.rows('.selected').data()[0].id;
	});


			
	
	$('#outletTable').on('click', 'tr', function () {
		$("tr").removeClass('selected');
        $(this).toggleClass('selected');
    } );
	
	

	

// 	var outlets 
	function retrieveOutlets(){
		 $.post('/absi-ims/ims-outlet/retrieveOutlets', {} , function(data) {
				 	console.log(data);		 	
				 	var outlets = data;
				 	constructDataTable(outlets);
			 }, 'json');
	}
	
	
	function constructDataTable(outlets){			  
		oTable = $("#outletTable").DataTable({
			  "aaData": outlets,
			  "aoColumnDefs":[{
			        "sTitle":"Outlet Name",
			       "data":  "name",
			       "targets" : [0]
			  },
			  {
			        "sTitle":"Contact Number",
			       "data":  "contactNumber",
			       "targets" : [1]
			  },
			  {
			        "sTitle":"Outlet Address",
					"data":  "address",
					"targets" : [2]
			  
			  },
			  {
			        "sTitle":"City",
			       "data": "city", 
			       "targets" : [3]
			  },
			  {
			        "sTitle":"Postal Code",
			       "data": "postalCode",
			       "targets" : [4]
			  }

			  ]
			});
	}
</script>