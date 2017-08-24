<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>Save Category</title>

</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Category Page</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save Category</h3>
	
		<form:form action="saveCategory" modelAttribute="category" method="POST">
		
			
			<table>
			
				<tbody>
					<tr>
					
						<form:hidden path="id"/>
					
					</tr>
					<tr>
						<td><label>Name:</label></td>
						<td><form:input path="name" /></td>
					</tr>
				
					<tr>
						<td><label>Description:</label></td>
						<td><form:input path="description" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/category/categories">Back to List</a>
		</p>
	
	</div>

</body>

</html>










