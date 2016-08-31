<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--     <div class="search-options"> -->
<!-- 		<input type="text" class="field"> -->
<!-- 		<input type="button" value="Search" class="search-btn button"> -->
<%-- 		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-product/new'"> --%>
<!-- 	</div> -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<table id="productTable" class="product-list">
	  <thead>
		<td> Supplier </td>
		<td> SKU </td>
	    <td> Product Name  </td>		
		<td> Product Category </td>
	    <td> Product Price  </td>
	    
	  </thead>
	  
	</table>

<script type="text/javascript">
	$(function() {
		$(".link").click(function() {
			var url = $(this).find(".view-url").html();
			validNavigation = true;
						window.location = $.trim(url);
		});
		hideButtons();
		retrieveProducts();
		
	});
	$("#btnAdd").on("click", function(){
		 location.href='${pageContext.request.contextPath}/ims-product/new';
	});
	
	$("#btnEdit").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-product/edit?productId=' + oTable.rows('.selected').data()[0].id;
	});
	
	$("#btnView").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-product/view/' + oTable.rows('.selected').data()[0].id;
	});
	
	function hideButtons(){
		$("#btnCancel").hide();
		$("#btnSubmit").hide();
		
	}
	
	$("#btnDelete").on("click", function(){
		location.href=  '${pageContext.request.contextPath}/ims-product/delete?productId=' + oTable.rows('.selected').data()[0].id;
	});


			
	
	$('#productTable').on('click', 'tr', function () {
		$("tr").removeClass('selected');
        $(this).toggleClass('selected');
    } );
	
	
	
	function retrieveProducts(){
		 $.post('/absi-ims/ims-product/retrieveProducts', {} , function(data) {
				 	console.log(data);		 	
				 	var products = data;
				 	constructDataTable(products);
			 }, 'json');
	}
	
	
	function constructDataTable(products){			  
		oTable = $("#productTable").DataTable({
			  "aaData": products,
			  "aoColumnDefs":[{
			        "sTitle":"Supplier",
			       "data": "client.name",
			       "targets" : [0]
			  },
			  {
			        "sTitle":"SKU",
			       "data":  "sku",
			       "targets" : [1]
			  },
			  {
			        "sTitle":"Product Name",
					"data":  "name",
					"targets" : [2]
			  
			  },
			  {
			        "sTitle":"Product Category",
			       "data": "category", 
			       "targets" : [3]
			  },
			  {
			        "sTitle":"Product Price",
			       "data": "price",
			       "targets" : [4]
			  }

			  ]
			});
	}
</script>