<!DOCTYPE html>
<html>
	<head>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	
	<body>
	
		<div style="float: left"><h2>LIBRARY (Name of administrator)</h2></div>
		
		<div style="float: right">
			<a href="${pageContext.request.contextPath}/main-page"><button class="add-button">LOG OUT</button></a>
			<a href="${pageContext.request.contextPath}/admin/administrators"><button class="add-button">Administrators</button></a>
		</div>
		
		
		<br><br><br><br><br><hr><br>
		<%@include file="navigation.jsp" %>
	
	</body>

</html>