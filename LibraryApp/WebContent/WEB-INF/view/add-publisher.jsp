<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Add Publisher</title>
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
	
		<div style="float: left">
			<h3>Save Publisher</h3>
		</div>
		<br><br><br><br><hr><br>
		<%@include file="navigation.jsp" %>
		<br><br><hr><br><br><br>
		<div  align="center">
			<form:form action="addPublisher" modelAttribute="publisher" method="POST">
				<form:hidden path="id"/>
				<h3>Publisher info </h3>
				<table class="tg">
					<tbody>
						<tr>
							<th>Name: </th>
							<td><form:input path="name" size="50"/></td>
						</tr>
						<tr>
							<th>Address: </th>
							<td><form:input path="address" size="50"/></td>
						</tr>
						<tr>
							<th>Phone: </th>
							<td><form:input path="phone" size="50"/></td>
						</tr>
					</tbody>
				</table>	
				<br>
				<input type="submit" value="Save" class="save"/>		
			</form:form>
		</div>
	</body>
</html>