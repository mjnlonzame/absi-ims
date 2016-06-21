<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" type="text/javascript"></script>
	
    <!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" type="text/javascript"></script>  


<script src="<c:url value="/resources/scripts/bootstrap-datepicker.js" />"></script>

</head>

<body>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	    <div class="search-options">
	    
		<input type="text" class="field">
		<input type="button" value="Search" class="search-btn button">
		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-inventory/new'">
	</div>
	<ul>
		<div class="select-inventory" onchange="retrieveInventories()">
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<li><label><strong> Inventory Type </strong></label> :<select
				id="type" onchange="checkValue(this.value)">
					<option>Daily</option>
					<option>Weekly</option>
			</select></li>

			<li id="weekly" style='display: none'><label><strong>
				From : </strong></label> <input id="startPeriod" type="text" name="startPeriod" /> &nbsp &nbsp <label><strong>
				To : </strong></label> <input id="endPeriod" type="text"  name="endPeriod"/>
			</li>
			<li id="daily"><label><strong> 
				Today : </strong></label> <input id="dailyPeriod" type="text" name="dailyPeriod"/></li>

			<li><label><strong> Client </strong></label>: 
				<select id="selectClient">
					<option value="">--SELECT--</option>
					<c:forEach items="${clients}" var="clientObj">
						<option value="${clientObj.id}">${clientObj.name}</option>
					</c:forEach> 
				</select>
			</li>

		</div>
	</ul>
	
	<table class="user-list" id="tableGrid">
		<thead>
		  <tr class="trhead">
	
		    <td> Outlet  </td>
<!-- 		    <td> Period  </td> -->
		    <td> To be encoded </td>
		    
		  </tr>
		</thead>
		<tbody>
		</tbody>
		<input type="hidden" id="modelAttr" name="modelAttr" value="${modelAttribute}"/>
	  
	</table>
</body>


<script type="text/javascript">

$(function(){			
	$('#dailyPeriod').datepicker({ format: 'mm-dd-yyyy',todayHighlight: true}).on('changeDate', function(ev)
			{	
			retrieveInventories();
				$('#dailyPeriod').datepicker('hide');
			});
	$('#startPeriod').datepicker({ format: 'mm-dd-yyyy',todayHighlight: true}).on('changeDate', function(ev)
			{	
				retrieveInventories();
				$('#startPeriod').datepicker('hide');
			});	
	$('#endPeriod').datepicker({ format: 'mm-dd-yyyy',todayHighlight: true}).on('changeDate', function(ev)
			{	
				retrieveInventories();
				$('#endPeriod').datepicker('hide');
			});	
	hideButtons();
});


$("#btnEdit").on("click", function(){
	location.href=  '${pageContext.request.contextPath}/ims-outlet/edit/' + oTable.rows('.selected').data()[0].id;
});

function hideButtons(){
	$("#btnCancel").hide();
	$("#btnSubmit").hide();
	$("#btnEdit").hide();
	$("#btnDelete").hide();
	
}


		




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

function retrieveInventories(){
	var clientId = $("#selectClient").val();
	var type = $("#type").val();
	
	if(type === 'Daily'){
		var period =formatDate( $("#dailyPeriod").val());
		console.log("period is " + period);
	 if(period !== "" && clientId !== "" ){
		 $.post('/absi-ims/ims-inventory/retrieveDaily', {clientId : clientId, period : period} , function(data) {
			 console.log("date is ", data );
			 $("#tableGrid tr:gt(0)").remove();
			 if(data === undefined){
				 return null;
			 } 
		        $.each( data,function(index, inventory) {
		        	//var strPeriod = formatDate(inventory.period);
		            $('#tableGrid').find('tbody')
		            .append($('<tr>')
		                    .append($('<td>').text(inventory.outlet))
		                   // .append($('<td>').text(strPeriod))
		                    .append($('<td>').text(inventory.products.join(', ')))
		                    )
						
		        });
		 }, 'json'); 
	 } 

	}else{
		var startPeriod =formatDate( $("#startPeriod").val());
		var endPeriod =formatDate( $("#endPeriod").val());
		
		if(startPeriod !== "" && endPeriod !== "" && clientId !== ""){
			 $.post('/absi-ims/ims-inventory/retrieveWeekly', {clientId : clientId, startPeriod : startPeriod, endPeriod : endPeriod} , function(data) {
				 console.log("date is ", data );
				 $("#tableGrid tr:gt(0)").remove();
				 if(data === undefined){
					 return null;
				 } 
				
			        $.each(data,function(index, inventory) {
// 			        	var startPeriod = formatDate(inventory.period[0]);
// 			        	var endPeriod = formatDate(inventory.period[1]);			        	
			            $('#tableGrid').find('tbody')
			            .append($('<tr>')
			                    .append($('<td>').text(inventory.outlet))
			                    //.append($('<td>').text(startPeriod + " to " + endPeriod))
			                    .append($('<td>').text(inventory.products.join(', ')))
			                    )
							
			        });
			 });
		}
	}
}

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [month, day, year].join('-');
}


</script>