\<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<tiles:importAttribute name="javascripts"/>
<tiles:importAttribute name="stylesheets"/>
		

<head>
	<title><tiles:insertAttribute name="title" ignore="false" /></title>

<%-- 	<script src="${pageContext.request.contextPath}/resources/js/lib/jquery/1.11.1/jquery.min.js" />  </script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap-datepicker.js" />  </script> --%>
<%-- 	<link rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/resources/css/style.css" /> --%>
<%-- 	<link rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/resources/css/utility.css" />  --%>
<%-- 	<link rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" /> --%>
	    <c:forEach var="css" items="${stylesheets}">
        <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>
    	    <c:forEach var="script" items="${javascripts}">
        <script src="<c:url value="${script}"/>"></script>
    </c:forEach>
</head>


<body>

<div class="wrapper-admin">
	<!-- Top Header -->
<!-- 	<div class="div-head"> -->
<%-- 		<label><c:out value="${role }" /></label> <label class="user-name"><c:out --%>
<%-- 				value="${userFullName}" /></label> <a --%>
<!-- 			href="/logout">Logouttt</a> -->
<!-- 	</div> -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	<div class="div-head" id="logoutHeader">

		<label><c:out value="${role }" /></label> <label class="user-name"><c:out
				value="${userFullName}" /></label> <a
			href="/absi-ims/login" id= "logout">Logout</a>
			<form id="logout-form" action="${pageContext.request.contextPath}/logout" method="post">
				<sec:csrfInput/>
			</form>
	</div>
	
	<!-- Header -->
	<div class="header">
		<img src="${pageContext.request.contextPath}/resources/images/LogiIcon.jpeg" />
		<strong>
			<tiles:insertAttribute name="pageTitle" />
		</strong>
		
				
	</div>
	

		<div class="user-top-menu">


			<input type="button" id="btnDelete" value="Delete"class="btnHeader button" />
			<input type="button" id="btnEdit" value="Edit" class="btnHeader button" />  
			<input type="button" id="btnView" value="View" class="btnHeader button" /> 
			<input type="button" id="btnAdd" value="Add" class="btnHeader button"> 
			<input type="button" id="btnCancel" value="Cancel" class="btnHeader button" />
			<input type="button" id="btnSubmit" value="Submit" class="btnHeader button" />


		</div>
		<div class="main-body">
		<tiles:insertAttribute name="leftMenu" />
		
		<div class="main-body-2">
			<tiles:insertAttribute name="body" />
		</div>
	</div>

</div>

</body>


<script type="text/javascript">

$(document).ready(function(){
// 	$("#logout").click(function(e){
// // 		$("#logout-form").submit();
// 		location.href='${pageContext.request.contextPath}/login';
// 	});
// 	location.href='${pageContext.request.contextPath}/login';

});
</script