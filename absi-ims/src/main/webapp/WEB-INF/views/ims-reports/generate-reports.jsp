<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
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
				Today : </strong></label> <input id="dailyPeriod" type="date" class="required"/></li>

			<li><label><strong> Client </strong></label>: 
				<select id="selectClient" class="required" >
				<option value="">--SELECT--
					</option>
					<c:forEach items="${clients}" var="clientObj">
						<option value="${clientObj.id}">${clientObj.name}</option>
					</c:forEach> </select></li>

		</div>
		
	</ul>
	
 	<input type="button" id="btn-generate-report" value="Submit" class="btnHeader button" onclick="generateReport()"/>
<!-- 	<a class="btn" data-toggle="modal" href="#myModal">View Monthly Sales Graph</a> -->
<!-- 	<div class="modal hide" id="myModal"> -->
<!-- 		<!-- note the use of "hide" class -->
<!-- 		<div class="modal-header"> -->
<!-- 			<button class="close" data-dismiss="modal">×</button> -->
<!-- 			<h3>Modal header</h3> -->
<!-- 		</div> -->
<!-- 		<div class="modal-body"> -->
			<canvas id="monthlyReport" width="50" height="50" ></canvas>
<!-- 		</div> -->
<!-- 		<div class="modal-footer"> -->
<!-- 			<a href="#" class="btn" data-dismiss="modal">Close</a> -->
<!-- 			<!-- note the use of "data-dismiss" -->
<!-- 			<a href="#" class="btn btn-primary">Save changes</a> -->
<!-- 		</div> -->
<!-- 	</div> -->
	</br>
	<input type="button" id="showSales" value="Show/Hide Monthly Sales" class="btn-default button" onclick="showSalesGraph()"/>​
</body>
</html>


<script type="text/javascript">
	
	$(document).ready(function(){
		hideButtons();
		retrieveAllInventories();
		$("#monthlyReport").hide();
	});
	function hideButtons(){
		$("#btnCancel").hide();
		$("#btnSubmit").hide();
		$("#btnEdit").hide();
		$("#btnDelete").hide();
		$("#btnAdd").hide();
		$("#btnView").hide();
	}
	
	function showSalesGraph(){
		$("#monthlyReport").toggle();
	}

	
	function retrieveAllInventories(){
		 $.post('/absi-ims/ims-report/retrieveAllInventories', {} , function(data) {
				 	console.log(data);		 	
				 	var inventories = data;
				 	var totalMonthlySales = [0, 0, 0, 0 , 0 , 0, 0, 0, 0, 0 , 0 , 0 ];
				 	for(var index in inventories){
				 		var inventory = inventories[index];
				 		var inventoryDate = new Date(inventory.period);
				 		console.log("date is ", inventoryDate);
				 		var inventoryMonth = inventoryDate.getMonth();
				 		var totalSales = computeTotalSales(inventory);
				 		totalMonthlySales[inventoryMonth] += totalSales;
				 	}
				 	
				 	console.log("totalMonthlySales", totalMonthlySales);
				 	generateTotalAmountOfftakeGraph(totalMonthlySales);
			 }, 'json');
	}
	
	function computeTotalSales(inventory){
		 var beginning = 0, ending = 0;
		 
		 beginning = inventory.previousStock + inventory.deliveredItem;
		 ending = inventory.gondolaItem + inventory.warehouseItem + inventory.shelvesItem;
		 
		 return beginning - ending;
	}
	
	function generateTotalAmountOfftakeGraph(totalMonthlyAmountOfftake){
		var ctx = document.getElementById("monthlyReport").getContext("2d")
		ctx.canvas.width = 100;
		ctx.canvas.height = 100;
		var data = {
			    labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
			    datasets: [
			        {
			            label: "Monthly Sales",
			            fill: false,
			            lineTension: 0.1,
			            backgroundColor: "rgba(75,192,192,0.4)",
			            borderColor: "rgba(75,192,192,1)",
			            borderCapStyle: 'butt',
			            borderDash: [],
			            borderDashOffset: 0.0,
			            borderJoinStyle: 'miter',
			            pointBorderColor: "rgba(75,192,192,1)",
			            pointBackgroundColor: "#fff",
			            pointBorderWidth: 1,
			            pointHoverRadius: 5,
			            pointHoverBackgroundColor: "rgba(75,192,192,1)",
			            pointHoverBorderColor: "rgba(220,220,220,1)",
			            pointHoverBorderWidth: 2,
			            pointRadius: 1,
			            pointHitRadius: 10,
			            data: totalMonthlyAmountOfftake,
			        }
			    ]
			};
		
		var  options = {
	        responsive: true,
	        maintainAspectRatio : false
	    };
		
		var myLineChart = Chart.Bar(ctx, {
		    data: data,
		    options: options
		});
	}

	function generateReport(){
		
		if(isFormValid()){
			var clientId = $("#selectClient").val();
			var type = $("#type").val();
			
			if(type==="Weekly"){
				var startPeriod = formatDate( $("#startPeriod").val());
				var endPeriod =formatDate($("#endPeriod").val());
				    window.location.href = 'http://localhost:8080/absi-ims/ims-report/weeklyxls/' + clientId + '/'   + startPeriod +  '/' + endPeriod;
			} else {
				var period =formatDate($("#dailyPeriod").val());
				    window.location.href = 'http://localhost:8080/absi-ims/ims-report/dailyxls/' + clientId + '/'  + period ;
			}

		} else {
			alert("Please complete required fields!");
		}

	}


	function checkValue(val) {

		if (val === "Daily") {
			$("#startPeriod").val("");
			$("#endPeriod").val("");
		    $("#startPeriod, #endPeriod").removeClass("required").removeClass("with-error");
		    $("#dailyPeriod").addClass("required");
			document.getElementById('daily').style.display = 'block';
			document.getElementById('weekly').style.display = 'none';
		} else {
			
			$("#dailyPeriod").val("");
	    	$("#dailyPeriod").removeClass("required").removeClass("with-error");
	    	$("#startPeriod, #endPeriod").addClass("required");
			document.getElementById('daily').style.display = 'none';
			document.getElementById('weekly').style.display = 'block';
		}

	}

	function formatDate(date) {
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
				+ d.getDate(), year = d.getFullYear();

		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;

		return [month, day, year].join('-');
	}

// 	function saveNewInventory() {
// 		document.getElementById("imsInventory").submit();
// 		alert("Data has been updated");
		
// 		if(isFormValid()){
// 			document.getElementById("imsInventory").submit();
// 			alert ("Data has been updated");
// 		} else {
// 			alert("Please complete required fields!");
// 		}
// 	}
</script>