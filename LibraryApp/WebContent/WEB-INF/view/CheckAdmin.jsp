<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>Save Administrator</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Administrator Page</h2>
		</div>
	</div>

	<div id="container">
		<h3>Check Administrator</h3>
	
		<form:form action="checkAdmin" modelAttribute="checkingAdministrator" method="POST">
		
			
			<table>
			
				<tbody>
					<tr>
					
						<form:hidden path="id"/>
					
					</tr>
					<tr>
						<td><label>User name:</label></td>
						<td><form:input path="username" /></td>
					</tr>
				
					<tr>
						<td><label>Password:</label></td>
						<td><form:input path="password" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Check" class="check" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/admin/administrators">Back to List</a>
		</p>
	
	</div>

</body>

</html>










