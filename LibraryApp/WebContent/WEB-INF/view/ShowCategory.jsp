<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>Save Category</title>
		<link type="text/css"
				rel="stylesheet"
				href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	
	<body>
		<div style="float: left">
			<h3>Save Category</h3>
		</div>
		<br><br><br><br><hr><br>
		<%@include file="navigation.jsp" %>
		<br><br><hr><br><br><br>
		<div align="center">
			<form:form action="saveCategory" modelAttribute="category" method="POST">
				<form:hidden path="id"/>
				<h3>Category info </h3>
				<table class="tg">
					<tbody>
						<tr>
							<th>Name:</th>
							<td><form:input path="name" size="50"/></td>
						</tr>
					
						<tr>
							<th>Description:</th>
							<td><form:input path="description" size="50"/></td>
						</tr>
					</tbody>
				</table>
				<br>
				<input type="submit" value="Save" class="save" />			
			</form:form>		
		</div>
	
	</body>

</html>










