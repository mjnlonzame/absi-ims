<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="false" /></title>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	<tilesx:useAttribute name="pageTitle" />





</body>
</html>