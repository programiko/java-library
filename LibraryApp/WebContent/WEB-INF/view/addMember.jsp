<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Save Member</title>
		<style>
		</style>
	</head>
	<body>
		<div>
			<h2>Save Member</h2>
		</div>
		<div>
			<form:form action="saveMember" modelAttribute="member" method="POST">
				<table>
					<tbody>
						<tr>
							<td>Name: </td>
							<td><form:input path="memberName"/></td>
						</tr>	
						<tr>
							<td>Surname: </td>
							<td><form:input path="memberSurename"/></td>
						</tr>	
						<tr>
							<td>Address: </td>
							<td><form:textarea path="memberAddress"/></td>
						</tr>	
						<tr>
							<td>Phone: </td>
							<td><form:input path="memberPhone"/></td>
						</tr>	
						<tr>
							<td>Active: </td>
							<td><form:input path="memberActivity"/></td>
						</tr>	
						<tr>
							<td>Class: </td>
							<td><form:input path="memberClass"/></td>
						</tr>
					</tbody>
				</table>
			</form:form>
		</div>
	</body>
</html>