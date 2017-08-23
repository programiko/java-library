<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
					
					<!-- Publisher info -->			
					<table>
						<tbody>
							<c:forEach var="publisher" items="${book.publishers}" varStatus="status">
								<tr>
									<td><label>${status.count}. </label></td>
									<td>Publisher Name: </td>
									<td><input name="publishers[${status.index}].name" value="${publisher.name}"/></td>
									<td>Publisher Address: </td>
									<td><input name="publishers[${status.index}].address" value="${publisher.address}"/></td>
									<td>Publisher Phone: </td>
									<td><input name="publishers[${status.index}].phone" value="${publisher.phone}"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table> 
					<hr>
					
					<!-- Category info -->
					<table>
						<tbody>
							<tr>
								<td>Category: </td>
								<td><form:input path="category.name"/></td>
								<td>Category Description: </td>
								<td><form:textarea path="category.description" cols="100" rows="5"/></td>
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