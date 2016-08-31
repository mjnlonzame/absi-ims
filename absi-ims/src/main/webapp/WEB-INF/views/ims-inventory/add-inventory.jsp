<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">	

<head>
<title>Inventory ABS Promotions Corporations</title>

<meta name="description" content="Login Page">
<meta name="viewport" content="width=device-width, initial-scale=1">




</head>

<body>
	<form:form id="imsInventory" modelAttribute="imsInventory" action="${pageContext.servletContext.contextPath}${action}" method="POST" cssClass="form-product">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			<ul>
				<div class="select-inventory" onchange="getInventory()">
					<li><label><strong> Inventory Type </strong></label>
					:<form:select  id="type" path="type" onchange="checkValue(this.value)">
							<option>Daily</option>
							<option>Weekly</option>
						</form:select>
					</li>
 				
					<li id="weekly" style='display:none'>
						<label><strong> From : </strong></label><form:input type="text" path="startPeriod" id="startPeriod" name="startPeriod"  /> &nbsp &nbsp
						<label><strong> To : </strong></label><form:input type="text" path="endPeriod" id="endPeriod" name="endPeriod"  />
					</li>
					<li id="daily" >
<!-- 						<label><strong> Today : </strong></label> -->
<%-- 						<form:input id="dailyPeriod" type="date" path="period" /> --%>
							<label> Today : </label>:<form:input type="text" path="period" id="period-dp" name="datepicker" class="required" />
					</li>

					<li><label><strong> Outlet </strong></label>:
						<form:select id="selectOutlet" path="outlet.id"  class="required" > 
						    <form:option value=""> --SELECT--</form:option>
					      <c:forEach items="${outlets}" var="outletObj">
					            <option id="selectedOutlet" value="${outletObj.id}">${outletObj.name}</option> 
					        </c:forEach>
					    </form:select>
					</li>	
					<li><label><strong> Client </strong></label>:
						<form:select id="selectClient" path="client.id" class="required" >
						    <form:option value=""> --SELECT--</form:option>
					      <c:forEach items="${clients}" var="clientObj">
					      	<option value="${clientObj.id}">${clientObj.name}</option> 
					        </c:forEach>
					    </form:select>
					</li>
					
					<li><label><strong> Product </strong></label>:
						<form:select id="selectProduct" path="product.id" class="required"  >
						    <form:option value=""> --SELECT--</form:option>
					      <c:forEach items="${products}" var="productObj">
					            <option value="${productObj.id}">${productObj.name}</option> 
					        </c:forEach>
					    </form:select>
					</li>
				</div>
				<div class="encoding-inventory">
							<div class="beginning-inventory">
								<strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  BEGINNING INVENTORY </strong>
								<br>
									<li><label><strong> Out-ofStock : </strong></label>:<form:input id="outOfStockDay" type="text" path="outOfStockDay" readonly="true"/></li>
									<li><label><strong> Previous : </strong></label><form:input id="previousStock" type="text" path="previousStock" readonly="true"/></li>
									<li><label><strong> Delivery : </strong></label><form:input id="deliveredItem" type="text" path="deliveredItem"  class="required" onchange="updatebeginningInventory()" readonly="false"/></li>	
									
									<div class="TOTAL">
										<li><label><strong> TOTAL : </strong></label><span id="beginningTotal"  >0</span> pcs </li>
									</div>
							</div>
						
						
							<div id="endingInv" class="ending-inventory" onchange="updateEndingInventory();updatebeginningInventory()	" >
								<strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  ENDING INVENTORY </strong>
								<br>

									<li><label><strong> Shelves : </strong></label><form:input id="shelvesItem" type="text" path="shelvesItem" value="0" class="required" readonly="false"/></li>
									<li><label><strong> Warehouse : </strong></label><form:input id="warehouseItem" type="text" path="warehouseItem" value="0" class="required" readonly="false"/></li>	
									<li><label><strong> Gondola : </strong></label><form:input id="gondolaItem" type="text" path="gondolaItem" value="0" class="required" readonly="false"/></li>	
									
									<div class="TOTAL">
										<li><label><strong> TOTAL :  </strong></label><span id="endingTotal" onchange="computeStockOfftake()">0 </span> pcs</li>
									</div>
							</div>
						
							<div class="total-inventory">
								<strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  TOTAL COMPUTATION </strong>
								<br>
									<label ><strong> TOTAL STOCKS OFFTAKE : </strong></label>  
									<form:input id="stockOfftake" type="decimal" path="stockOfftake"  style="border:0px;" readonly="true"></form:input>
									<br>
									<label><strong> TOTAL AMOUNT OFFTAKE` : </strong></label>
									<form:input id="amountOfftake" type="decimal" path="amountOfftake"  style="border:0px;" readonly="true"></form:input>
						
									
							</div>
					</div>
				
					

			</ul>
	</form:form>
</body>
</html>


<script type="text/javascript">
	
		
$(function(){		
	hideButtons();
			$('#period-dp').datepicker({ format: 'mm-dd-yyyy',todayHighlight: true}).on('changeDate', function(ev)
					{	
						getInventory();
						$('#period-dp').datepicker('hide');
					});
			$('#startPeriod').datepicker({ format: 'mm-dd-yyyy',todayHighlight: true}).on('changeDate', function(ev)
					{	
						getInventory();
						$('#startPeriod').datepicker('hide');
					});	
			$('#endPeriod').datepicker({ format: 'mm-dd-yyyy',todayHighlight: true}).on('changeDate', function(ev)
					{	
						getInventory();
						$('#endPeriod').datepicker('hide');
					});	
		});
		
		
		
$("#btnSubmit").on('click', function(){
	saveNewInventory();
});
$("#btnCancel").on('click', function(){
	location.href='${pageContext.request.contextPath}/ims-inventory';
});

function hideButtons(){
	$("#btnEdit").hide();
	$("#btnDelete").hide();
	$("#btnAdd").hide();
	$("#btnView").hide();
}

		
var productPrice = 0;
function checkValue(val) {

    if(val==="Daily"){
    	$("#shelvesItem").attr("readonly", false);
    	$("#warehouseItem").attr("readonly", false);
    	$("#gondolaItem").attr("readonly", false);
    	$("#deliveredItem").attr("readonly", false);
		$("#startPeriod").val("");
	    $("#endPeriod").val(""); 
	    $("#startPeriod, #endPeriod").removeClass("required").removeClass("with-error");
	    $("#period-dp").addClass("required");
        document.getElementById('daily').style.display='block';
        document.getElementById('weekly').style.display='none';
    } else {
    	$("#shelvesItem").attr("readonly", true);
    	$("#warehouseItem").attr("readonly", true);
    	$("#gondolaItem").attr("readonly", true);
    	$("#deliveredItem").attr("readonly", true);
    	$("#period-dp").val("");
    	$("#period-dp").removeClass("required").removeClass("with-error");
    	$("#startPeriod, #endPeriod").addClass("required");
        document.getElementById('daily').style.display='none';
        document.getElementById('weekly').style.display='block';     	
    }

}


/* $('#endingInv').children().attr('readonly', true); */

function computeStockOfftake(){
	var endingInventory = parseInt($("#endingTotal").text());
	var beginningInventory = parseInt($("#beginningTotal").text());
	
	var totalStockOfftake = beginningInventory - endingInventory;
	console.log("totalStockOfftake" + totalStockOfftake);
	$("#stockOfftake").text(totalStockOfftake);
	$("#stockOfftake").val(totalStockOfftake);
}

function updateEndingInventory(){
	console.log("wew");
	
	var gondola = parseInt($("#gondolaItem").val());
	var warehouse = parseInt($("#warehouseItem").val());
	var shelves = parseInt($("#shelvesItem").val());
	
	var total = gondola + warehouse + shelves;
	console.log("total is " + total);	
	
	
// 	if(total < $("#beginningTotal").text()){
		$("#endingTotal").text(total);
// 		VAR ENDINGINVENTORY = PARSEINT($("#ENDINGTOTAL").TEXT());
// 		VAR BEGINNINGINVENTORY = PARSEINT($("#BEGINNINGTOTAL").TEXT());
		
		computeTotalComputation();
// 	}
		


}

// $("#endingInv").on("change", function(){
// 	console.log("CHANGE!!!");
// 	var gondola = parseInt($("#gondolaItem").val());
// 	var warehouse = parseInt($("#warehouseItem").val());
// 	var shelves = parseInt($("#shelvesItem").val());
	
	
// });


function computeTotalComputation(){
	var endingInventory = parseInt($("#endingTotal").text());
	var beginningInventory = parseInt($("#beginningTotal").text());
	
	var totalStockOfftake = beginningInventory - endingInventory;
	console.log("totalStockOffTake" + totalStockOfftake);
	$("#stockOfftake").text(totalStockOfftake);
	$("#stockOfftake").val(totalStockOfftake);
	if(productPrice !== 0){
		var totalAmountOfftake = (beginningInventory * productPrice ) - (endingInventory *  productPrice);
		console.log("totalAmountOffTake" + totalAmountOfftake);
		$("#amountOfftake").text(totalAmountOfftake);
		$("#amountOfftake").val(totalAmountOfftake);
		
	}
}

$("#warehouseItem, #gondolaItem, #shelvesItem").on("change", function(){
	var previousStock = parseInt($("#previousStock").val());
	var deliveredItem = parseInt($("#deliveredItem").val());
	var beginningInventory = deliveredItem + previousStock;	console.log("dsadsa");
	
	var gondola = parseInt($("#gondolaItem").val());
	var warehouse = parseInt($("#warehouseItem").val());
	var shelves = parseInt($("#shelvesItem").val());
	var endingInventory = gondola + warehouse + shelves;

	if(endingInventory > beginningInventory){
    	$(this).val(0)
    	alert("Inputting this will make the ending inventory greater than the beginning inventory. Please input a valid one!")
	}
});

function updatebeginningInventory(){
	var previousStock = parseInt($("#previousStock").val());
	var deliveredItem = parseInt($("#deliveredItem").val());
	console.log("previosu stock is " + previousStock);
	var total = deliveredItem + previousStock;
	
	$("#beginningTotal").text(total);
	computeTotalComputation();
}



$("#selectOutlet").change(function(){
	var outletId = $("#selectOutlet").val();

		    $.post('/absi-ims/filterClient', {id : outletId} , function(data) {
		    	console.log(data);
		  		console.log("damn");
	 	        $('#selectClient')
	 	          .find('option').remove().end();
	 	       $('#selectClient').append($("<option>").attr("value", "").text("--SELECT--"));
	 	        $.each(data, function(index, object){
	 	        	console.log("object is " + object);
	 	        	$('#selectClient').append($("<option>").attr("value", object.id).attr("name", "dasds").text(object.name));
	 	        });
	 	       
		    }, 'json');

});

$("#selectClient").change(function(){
	var clientId = $("#selectClient").val();

	/*$.post('/absi-ims/filterProduct', {id : clientId} , function(data) {*/
		$.ajax({ 	
			method: 'POST',
			url: '/absi-ims/filterProduct', 
			dataType: 'json', 
			data: {id : clientId}	
		}).done( function(data) {
		    	console.log(data);
		  		console.log("damn");
	 	        $('#selectProduct') 
	 	          .find('option').remove().end();
	 	       $('#selectProduct').append($("<option>").attr("value", "").text("--SELECT--"));
	 	        $.each(data, function(index, object){
	 	        	console.log("object is " + object);
	 	        	$('#selectProduct').append($("<option>").attr("value", object.id).text(object.name));
	 	        });
	 	       
		    }, 'json');

});

 function getInventory(){
	 var clientId = $("#selectClient").val();
	 var productId = $("#selectProduct").val();
	 var outletId = $("#selectOutlet").val();
	 var strPeriod = $("#period-dp").val();
	 console.log("period is ", strPeriod);
		var strStartPeriod = $("#startPeriod").val();
		var strEndPeriod =$("#endPeriod").val();
		//console.log(strEndPeriod.toString());
	if(( clientId !== "" && productId !== "" && outletId !== "") && ( $("#period-dp").val() !=="" || ( $("#startPeriod").val() !=="" &&  $("#endPeriod").val() !==""))) {
		
		var product;
		var period = new Date(strPeriod);
		 $.post('/absi-ims/ims-product/retrieveProduct', {id : productId} , function(data) {
		 	product = data;
		 	productPrice = product.price;
		 }, 'json');
		 
		if($("#type").val() === 'Daily' ){
			
			period.setDate(period.getDate()-1) ;
			var strPeriod = formatDate(period);	
			 $.post('/absi-ims/ims-inventory/retrievePrevious', {productId : productId, outletId: outletId,  period : strPeriod} , function(data) {
				 	console.log(data);
				 	if(data.stockOfftake < 20 && data.id != null){
				 		alert("Threshold limit is reached, please be informed!");
				 	}
				 	$("#previousStock").val(data.stockOfftake);
				 	$("#outOfStockDay").val(data.outOfStockDay);
				 	$("#deliveredItem").val("");
				 }, 'json');
		} else {

			var startPeriod = new Date(strStartPeriod);
			var endPeriod = new Date(strEndPeriod);
			
 			if(startPeriod > endPeriod){
				return null;
			} 
 			
			var periods = [];
			var inventories = [];
			periods.push(strStartPeriod);
			while(strStartPeriod !== strEndPeriod){
				startPeriod.setDate(startPeriod.getDate() + 1);
				strStartPeriod = formatDate(startPeriod);	
				periods.push(strStartPeriod);
				console.log(strStartPeriod)
			}
		
			 $.post('/absi-ims/ims-inventory/retrieveInventories', {productId : productId, outletId: outletId, periods : periods} , function(data) {
				 	console.log(data);		 	
				 	inventories = data;
				 	computeWeeklyInventories(inventories);
				 }, 'json');

		}


		
	
	}
	 


};

function computeWeeklyInventories(inventories){
	var previousTotal = 0;
	var deliveryTotal = 0;
	var outOfStock;
	var gondolaTotal = 0;
	var warehouseTotal = 0;
	var shelvesTotal = 0;
	for(var index in inventories){
		var inventory = inventories[index];
		previousTotal += inventory.previousStock;
		deliveryTotal += inventory.deliveredItem;
		gondolaTotal += inventory.gondolaItem;
		warehouseTotal += inventory.warehouseItem;
		shelvesTotal += inventory.shelvesItem;
		if(index == inventories.length - 1){
			outOfStock = inventory.outOfStockDay;
		}
	}
 	$("#previousStock").val(previousTotal);
 	$("#outOfStockDay").val(outOfStock);
 	$("#deliveredItem").val(deliveryTotal);
	$("#gondolaItem").val(gondolaTotal);
	$("#warehouseItem").val(warehouseTotal);
	$("#shelvesItem").val(shelvesTotal);
 	updatebeginningInventory();
 	updateEndingInventory();
	
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


function saveNewInventory()
{


	
	if(isFormValid()){
		document.getElementById("imsInventory").submit();
		alert ("Data has been updated");
	} else {
		alert("Please complete required fields!");
	}
}

</script>