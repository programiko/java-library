<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Save Book</title>
	</head>
	<body>
		<div>
			<h2>Save Book</h2>
		</div>
		<div>
			<form:form action="saveBook" modelAttribute="book" method="POST">
				
				<!-- associate this data with member id -->
				<form:hidden path="bookId"/>
				
				<!-- Book info -->
				<table>
					<tbody>
						<tr>
							<td>Title: </td>
							<td><form:input path="bookTitle"/></td>
						</tr>	
						<tr>
							<td>Number of Pages: </td>
							<td><form:input path="numberOfPages"/></td>
						</tr>	
						<tr>
							<td>Number of Copies: </td>
							<td><form:input path="numberOfCopies"/></td>
						</tr>
						<tr>
							<td>Location: </td>
							<td><form:input path="bookLocation"/></td>
						</tr>	
					</table>
					<hr>
					<!-- Author info -->
					Author info
					
					<hr>
					<table>
						<tbody>
							<tr>
								<td>Publisher Name: </td>
								<td>
									<spring:bind path="book.publisher">
										<form:input path="publisher.name"/>
									</spring:bind>
								</td>
							</tr>	
							<tr>
								<td>Publisher Address: </td>
								<td>
									<spring:bind path="book.publisher">
										<form:input path="publisher.address"/>
									</spring:bind>
								</td>
							</tr>
							<tr>
								<td>Publisher Phone: </td>
								<td>
									<spring:bind path="book.publisher">
										<form:input path="publisher.phone"/>
									</spring:bind>
								</td>
							</tr>
						</tbody>
					</table>
					<hr>
				<input type="submit" value="Save" class="add-button"/>				
			</form:form>
			<div>
				<p><a href="${pageContext.request.contextPath}/book/books">Back to books</a></p>
			</div>
		</div>
	</body>
</html>