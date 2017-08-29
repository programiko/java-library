<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Save Member</title>
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
		<div style="float: left">
			<h2>Save Member</h2>
		</div>
		<div style="float: right">
			<a href="${pageContext.request.contextPath}/member/members"><button class="add-button">Members</button></a>
		</div>
		<br><br><br><br><hr>
		<div align="center">
		
			<form:form action="saveMember" modelAttribute="member" method="POST">
				
				<!-- associate this data with member id -->
				<form:hidden path="memberId"/>
				<h3>Member info </h3>
				<table class="tg">
					<tbody>
						<tr>
							<th>Name: </th>
							<td><form:input path="memberName" size="50"/></td>
						</tr>	
						<tr>
							<th>Surname: </th>
							<td><form:input path="memberSurename" size="50"/></td>
						</tr>	
						<tr>
							<th>Address: </th>
							<td><form:input path="memberAddress" size="50"/></td>
						</tr>	
						<tr>
							<th>Phone: </th>
							<td><form:input path="memberPhone" size="50"/></td>
						</tr>	
						<tr>
							<th>Active: </th>
							<td><form:input path="memberActivity" size="50"/></td>
						</tr>	
						<tr>
							<th>Class: </th>
							<td><form:input path="memberClass" size="50"/></td>
						</tr>
					</tbody>
				</table>
				<br>
				<input type="submit" value="Save" class="add-button"/>					
			</form:form>
		</div>
	</body>
</html>