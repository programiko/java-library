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
				<form:hidden path="category.id"/>
				
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
					<!-- Author info  -->
					<table>
						<tbody>
							<c:if test="${!empty book.authors}">
								<c:forEach var="author" items="${book.authors}" varStatus="status">
									<form:hidden path="authors[${status.index}].authorsId"/>
									<tr>
										<td><label>${status.count}. </label></td>
										<td>Author Name: </td>
										<td><input type="text" value="${author.authorsName}" name="authors[${status.index}].authorsName"/></td>
										<td>Author Surname: </td>
										<td><input type="text" value="${author.authorsSurname}" name="authors[${status.index}].authorsSurname"/></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty book.authors}">
							<form:hidden path="author.authorsId"/>
								<td>Author Name: </td>
								<td><input value="${author.authorsName}" name="authors[0].authorsName"/></td>
								<td>Author Surname: </td>
								<td><input value="${author.authorsSurname}" name="authors[0].authorsSurname"/></td>
							</c:if>
						</tbody>
					</table>
					<hr>
					
					<!-- Publisher info --> 		
					<table>
						<tbody>
							<c:if test="${!empty book.publishers}">
								<c:forEach var="publisher" items="${book.publishers}" varStatus="status">
								<form:hidden path="publishers[${status.index}].id"/>
									<tr>
									
										<td><label>${status.count}. </label></td>
										<td>Publisher Name: </td>
										<td><input type="text" value="${publisher.name}" name="publishers[${status.index}].name"/></td>
										<td>Publisher Address: </td>
										<td><input type="text" value="${publisher.address}" name="publishers[${status.index}].address"/></td>
										<td>Publisher Phone: </td>
										<td><input type="text" value="${publisher.phone}" name="publishers[${status.index}].phone"/></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty book.publishers}">
							<form:hidden path="publisher.id"/>
								<td>Publisher Name: </td>
								<td><input value="${publisher.name}" name="publishers[0].name"/></td>
								<td>Publisher Address: </td>
								<td><input value="${publisher.address}" name="publishers[0].address"/></td>
								<td>Publisher Phone: </td>
								<td><input value="${publisher.phone}" name="publishers[0].phone"/></td>
							</c:if>
						</tbody>
					</table>	
					<hr>
					
					<!-- Category info -->
					
					<table>
						<tbody>
							<tr><form:hidden path="category.id"/>
								<td>Category: </td>
								<td><form:input path="category.name"/></td>
								<td>Category Description: </td>
								<td><form:input path="category.description" size="100"/></td>
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