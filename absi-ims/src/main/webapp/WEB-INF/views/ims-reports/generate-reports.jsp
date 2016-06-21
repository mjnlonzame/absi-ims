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
	
	<input type="button" id="btn-generate-report" value="Submit" class="btnHeader button" onclick="generateReport()"/>
	<canvas id="monthlyReport" width="50" height="50"></canvas>

</body>
</html>


<script type="text/javascript">
	
	$(document).ready(function(){
		retrieveAllInventories();
	});
	
	function retrieveAllInventories(){
		 $.post('/absi-ims/ims-report/retrieveAllInventories', {} , function(data) {
				 	console.log(data);		 	
				 	var inventories = data;
				 	var totalMonthlyAmountOfftake = [0, 0, 0, 0 , 0 , 0, 0, 0, 0, 0 , 0 , 0 ];
				 	for(var index in inventories){
				 		var inventory = inventories[index];
				 		var inventoryDate = new Date(inventory.period);
				 		console.log("date is ", inventoryDate);
				 		var inventoryMonth = inventoryDate.getMonth();
				 		totalMonthlyAmountOfftake[inventoryMonth] += inventory.amountOfftake;
				 	}
				 	
				 	console.log("totalMonthlyAmountOfftake", totalMonthlyAmountOfftake);
				 	generateTotalAmountOfftakeGraph(totalMonthlyAmountOfftake);
			 }, 'json');
	}
	
	function generateTotalAmountOfftakeGraph(totalMonthlyAmountOfftake){
		var ctx = document.getElementById("monthlyReport").getContext("2d")
		ctx.canvas.width = 100;
		ctx.canvas.height = 100;
		var data = {
			    labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
			    datasets: [
			        {
			            label: "Monthly amount offtake",
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
		var clientId = $("#selectClient").val();
		var type = $("#type").val();
		
		if(type==="Weekly"){
			var startPeriod = formatDate( $("#startPeriod").val());
			var endPeriod =formatDate($("#endPeriod").val());
			$('#btn-generate-report').click(function() {
			    window.location.href = 'http://localhost:8080/absi-ims/ims-report/weeklyxls/' + clientId + '/'   + startPeriod +  '/' + endPeriod;
			
			});
		} else {
			var period =formatDate($("#dailyPeriod").val());
			$('#btn-generate-report').click(function() {
			    window.location.href = 'http://localhost:8080/absi-ims/ims-report/dailyxls/' + clientId + '/'  + period ;
			

			});
		}

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

// 	$("#selectOutlet").change(
// 			function() {
// 				var outletId = $("#selectOutlet").val();

// 				$.post('/absi-ims/filterClient', {
// 					id : outletId
// 				},
// 						function(data) {
// 							console.log(data);
// 							console.log("damn");
// 							$('#selectClient').find('option').remove().end();
// 							$('#selectClient').append(
// 									$("<option>").attr("value", "").text(
// 											"--SELECT--"));
// 							$.each(data, function(index, object) {
// 								console.log("object is " + object);
// 								$('#selectClient').append(
// 										$("<option>").attr("value", object.id)
// 												.attr("name", "dasds").text(
// 														object.name));
// 							});

// 						}, 'json');

// 			});

// 	$("#selectClient").change(
// 			function() {
// 				clientId = $("#selectClient").val();

// 				/*$.post('/absi-ims/filterProduct', {id : clientId} , function(data) {*/
// 				$.ajax({
// 					method : 'POST',
// 					url : '/absi-ims/filterProduct',
// 					dataType : 'json',
// 					data : {
// 						id : clientId
// 					}
// 				}).done(
// 						function(data) {
// 							console.log(data);
// 							console.log("damn");
// 							$('#selectProduct').find('option').remove().end();
// 							$('#selectProduct').append(
// 									$("<option>").attr("value", "").text(
// 											"--SELECT--"));
// 							$.each(data, function(index, object) {
// 								console.log("object is " + object);
// 								$('#selectProduct').append(
// 										$("<option>").attr("value", object.id)
// 												.text(object.name));
// 							});

// 						}, 'json');

// 			});
// 	function getInventory() {
// 		console.log("getting inventory");
// 		 var clientId = $("#selectClient").val();
// 		 productId = $("#selectProduct").val();
// 		 var outletId = $("#selectOutlet").val();
// 		 period = new Date($("#dailyPeriod").val());
// 		startPeriod = $("#startPeriod").val();
// 		endPeriod =$("#endPeriod").val();

// 		if(( clientId !== "" && productId !== "" && outletId !== "") && ( $("#dailyPeriod").val() !=="" || ( $("#startPeriod").val() !=="" &&  $("#endPeriod").val() !==""))) {
			
// 			var product;
// 			 $.post('/absi-ims/ims-product/retrieveProduct', {id : productId} , function(data) {
// 			 	product = data;
// 			 	productPrice = product.price;
// 			 }, 'json');
			 
// 			if($("#type").val() === 'Daily' ){
// 				console.log("DAILLLLY");
// 				period.setDate(period.getDate()-1);
//  			 period = formatDate(period);	
// // 				 $.post('/absi-ims/ims-inventory/retrievePrevious', {productId : productId, period : strPeriod} , function(data) {
// // 					 	console.log(data);
// // 					 	$("#previousStock").val(data.stockOffTake);
// // 					 	$("#outOfStockDay").val(data.outOfStockDay);
// // 					 	$("#deliveredItem").val("");
// // 					 }, 'json');
// 			} else {
// 				console.log("weeeeeeeekly");
				
				
// // 				var startPeriod = new Date(strStartPeriod);
// // 				var endPeriod = new Date(strEndPeriod);
				
// // 				console.log("start period " + startPeriod);
// // 				console.log("end period " + endPeriod);
// // 	 			if(startPeriod > endPeriod){
// // 					return null;
// // 				} 
	 			
// //  				periods = [];

// // 				periods.push(strStartPeriod);
// // 				while(strStartPeriod !== strEndPeriod){
// // 					startPeriod.setDate(startPeriod.getDate() + 1);
// // 					strStartPeriod = formatDate(startPeriod);	
// // 					periods.push(strStartPeriod);
// // 					console.log(strStartPeriod)
// // 				}


// 			}
		


			
		
// 		}
		 


// 	};


	function formatDate(date) {
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
				+ d.getDate(), year = d.getFullYear();

		if (month.length < 2)
			month = '0' + month;
		if (day.length < 2)
			day = '0' + day;

		return [month, day, year].join('-');
	}

	function saveNewInventory() {
		document.getElementById("imsInventory").submit();
		alert("Data has been updated");
	}
</script>