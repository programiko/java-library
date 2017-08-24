<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Save Authors</title>
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
			<div id="wrapper">
				<div id = "header">
						<h3>Authors List</h3>
						<br>
						<div id = "container">
						<h4> Save Authors </h4>

				<form:form action = "saveAuthors" modelAttribute="authors" method="POST">
				
				<form:hidden path="authorsId"/>
				<table>
				<tbody>
				
				<tr>
					<td><label>Authors name</label>
					<td><form:input path="authorsName"/>
					
					<td><label>Authors surname</label>
					<td><form:input path = "authorsSurname"/>
					
					</tr>
				</tbody>
					
				</table>
<input type="submit" value="Save" class ="add-button"/>
	</form:form>
	
<div>
	<p><a href="${pageContext.request.contextPath}/author/authors">Back to authors</a></p>
			</div>
		
			</div>
		</div>
	</div>
	</body>

</html>