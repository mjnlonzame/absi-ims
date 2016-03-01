<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html lang="en">
  <head>
    <title></title>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Bootstrap -->
    <link href="../css/utility.css" rel="stylesheet">  
    <link href="../css/style.css" rel="stylesheet"> 
	<link rel="stylesheet" href="..\..\ABS Promotions layout\BOOTSTRAP\bootstrap-3.3.5-dist\bootstrap-3.3.5-dist\css\bootstrap.min.css">
	
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>      
  </head>
  
  <body>   
			<button class="btnHeader" type="button">Cancel</button>
			<button class="btnHeader" type="button">Delete</button>
			<button class="btnHeader" type="button">Edit</button>
			<button class="btnHeader" type="button">Submit</button>
		
		
		
      <!-- Main Body -->

    <div class="main-body-2">
        <form class="form-user add-product">
			<ul>
				<li><label><strong> Outlet Store </strong></label>:<select>
				                                <option>  </option>
												<option> SM Hypermarket </option>
				                                <option> Makati Supermarket </option>
				                              </select>
				</li>
				
				<li><label><strong> Supplier </strong></label>:<select>
												<option>  </option>
												<option> Century </option>
												<option> Biolinks </option>
											</select>
				</li>
				
				<li><label><strong> Product Categroy </strong></label>:<select>
												<option>  </option>
												<option> Shampoo </option>
												<option> Soap </option>
												<option> Conditioner </option>
												<option> Facial Wash </option>
											</select>
				</li>
				
				
				<li><label><strong> Product Name </strong></label>:<input type="text"/></li>
				<li><label><strong> Unit Price </strong></label>:<input type="text"/></li>
				<li><label><strong> SKU </strong></label>:<input type="text"/></li>
							
				<li>
					<label><strong> Product Description </strong></label>: 
					<textarea class="form-control" rows="4"></textarea>
				
				</li>
	
			
			</ul>
        </form>
    </div>
        
      
  </body>
</html>