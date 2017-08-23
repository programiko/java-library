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
							<td>Category: </td>
							<td><form:input path="category"/></td>
						</tr>
						<tr>
							<td>Location: </td>
							<td><form:input path="bookLocation"/></td>
						</tr>	
					</table>
					<hr>
					<!-- Author info -->
					<table>
						<tbody>
							<c:forEach var="author" items="${book.authors}" varStatus="status">
								<tr>
									<td><label>${status.count}. </label></td>
									<td>Author Name: </td>
									<td><input name="authors[${status.index}].authorsName" value="${author.authorsName}"/></td>
									<td>Author Surname: </td>
									<td><input name="authors[${status.index}].authorsSurname" value="${author.authorsSurname}"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr>				
					<table>
						<tbody>
							<tr>
								<td><label>${status.count}. </label></td>
								<td>Publisher Name: </td>
								<td><input name="publishers[${status.index}].name" value="${publisher.name}"/></td>
								<td>Publisher Address: </td>
								<td><input name="publishers[${status.index}].address" value="${publisher.address}"/></td>
								<td>Publisher Phone: </td>
								<td><input name="publishers[${status.index}].phone" value="${publisher.phone}"/></td>
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