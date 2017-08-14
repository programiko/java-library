<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Save Member</title>
		<style type="text/css">
		.add-button {
			border: 1px solid #666; 
			border-radius: 5px; 
			padding: 4px; 
			font-size: 12px;
			font-weight: bold;
			width: 120px; 
			padding: 5px 10px; 		
			margin-bottom: 15px;
		}
		</style>
	</head>
	<body>
		<div>
			<h2>Save Member</h2>
		</div>
		<div>
			<form:form action="saveMember" modelAttribute="member" method="POST">
				
				<!-- associate this data with member id -->
				<form:hidden path="memberId"/>
				
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
							<td><form:input path="memberAddress"/></td>
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
						<tr>
							<td></td>
							<td><input type="submit" value="Save" class="add-button"/></td>
						</tr>
					</tbody>
				</table>				
			</form:form>
			<div>
				<p><a href="${pageContext.request.contextPath}/admin/members">Back to members</a></p>
			</div>
		</div>
	</body>
</html>