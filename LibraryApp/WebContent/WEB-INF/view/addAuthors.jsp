<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Save Authors</title>
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
		<div style="float: left">
			<h2> Save Author </h2>
		</div>
		<div style="float: right">
			<a href="${pageContext.request.contextPath}/author/authors"><button class="add-button">Authors</button></a>
		</div>
		<br><br><br><br><hr>
		<div  align="center">
			<form:form action = "saveAuthors" modelAttribute="authors" method="POST">	
				<form:hidden path="authorsId"/>
				<h3>Author info </h3>
				<table class="tg">
					<tbody>					
						<tr>
							<th>Name: </th>
							<td><form:input path="authorsName" size="50"/></td>
						</tr>	
						<tr>	
							<th>Surname: </th>
							<td><form:input path = "authorsSurname" size="50"/></td>	
						</tr>
					</tbody>						
				</table>
				<br>
				<input type="submit" value="Save" class ="add-button" size="50"/>
			</form:form>
		
		</div>
	</body>

</html>