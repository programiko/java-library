<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	
	<body>
	
		<c:if test="${!empty admin}">
            <c:forEach items="${admin}" var="logginSucces">
            </c:forEach>
            </c:if>
	
		<div style="float: left"><h2>Libraries Panel </h2></div>
	
		<div style="float: right">
			<a href="${pageContext.request.contextPath}/main-page"><button class="add-button">LOG OUT</button></a>
			<a href="${pageContext.request.contextPath}/admin/administrators"><button class="add-button">Administrators</button></a>
		</div>
	
		
		<br><br><br><br><br><hr><br>
		<%@include file="navigation.jsp" %>
	
	</body>

</html>