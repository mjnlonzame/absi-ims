<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="false" /></title>
</head>

<div class="wrapper-admin">
	
	<!-- Top Header -->	
	<div class="div-head">
				
			<tiles:insertAttribute name="header" />
	</div>	

	<!-- Left Menu -->
	<div id="leftMenu">
		<tiles:insertAttribute name="leftMenu" />
	</div>

	
	<!-- Body -->
	
		 <div class="main-body-2">	
			<div class="main-body-3">
			<tiles:insertAttribute name="body" />
			</div>
		</div>				
	
			
			
	
		
	
	


		
	<!-- <div id="footer">
		<tiles:insertAttribute name="footer" />
	</div> 
	-->
	
</div>  


</body>
</html>