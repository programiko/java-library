<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Save Book</title>
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
		<div style="float: left">
			<h2>Save Book</h2>
		</div>
		<div style="float: right">
				<a href="${pageContext.request.contextPath}/book/books"><button class="add-button">Books</button></a>
		</div>
		<br><br><br><br><hr>
		<div align="center">
			<form:form action="saveBook" modelAttribute="book" method="POST">	
					<form:hidden path="bookId"/>
					<form:hidden path="category.id"/>
									
					<div>
						<h3>Book info </h3>
						<table class="tg">
							<tbody>
								<tr>
									<th>Title: </th>
									<td><form:input path="bookTitle" size="50"/></td>
								</tr>	
								<tr>
									<th>Number of Pages: </th>
									<td><form:input path="numberOfPages" size="50" /></td>
								</tr>	
								<tr>
									<th>Number of Copies: </th>
									<td><form:input path="numberOfCopies" size="50"/></td>
								</tr>
								<tr>
									<th>Location: </th>
									<td><form:input path="bookLocation" size="50" /></td>
								</tr>	
							</tbody>
						</table>
					</div>
					<br>
					<div>
						<h3> Author info </h3>
						<table class="tg">
							<tbody>
								<c:if test="${!empty book.authors}">
									<c:forEach var="author" items="${book.authors}" varStatus="status">
										<form:hidden path="authors[${status.index}].authorsId"/>
										<tr>
											<th>Author Name: </th>
											<td><input type="text" value="${author.authorsName}" name="authors[${status.index}].authorsName" size="50"/></td>
										</tr>
										<tr>
											<th>Author Surname: </th>
											<td><input type="text" value="${author.authorsSurname}" name="authors[${status.index}].authorsSurname" size="50"/></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty book.authors}">
									<tr>
										<th>Author Name: </th>
										<td><input value="${author.authorsName}" name="authors[0].authorsName" size="50"/></td>
									</tr>
									<tr>
										<th>Author Surname: </th>
										<td><input value="${author.authorsSurname}" name="authors[0].authorsSurname" size="50"/></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<br> 		
					<div>
						<h3>Publisher info </h3>
						<table class="tg">
							<tbody>
								<c:if test="${!empty book.publishers}">
									<c:forEach var="publisher" items="${book.publishers}" varStatus="status">
									<form:hidden path="publishers[${status.index}].id"/>
										<tr>
											<th>Publisher Name: </th>
											<td><input type="text" value="${publisher.name}" name="publishers[${status.index}].name" size="50"/></td>
										</tr>
										<tr>
											<th>Publisher Address: </th>
											<td><input type="text" value="${publisher.address}" name="publishers[${status.index}].address" size="50"/></td>
										</tr>
										<tr>
											<th>Publisher Phone: </th>
											<td><input type="text" value="${publisher.phone}" name="publishers[${status.index}].phone"/></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty book.publishers}">
									<tr>
										<th>Publisher Name: </th>
										<td><input value="${publisher.name}" name="publishers[0].name" size="50"/></td>
									</tr>
									<tr>
										<th>Publisher Address: </th>
										<td><input value="${publisher.address}" name="publishers[0].address" size="50"/></td>
									</tr>
									<tr>
										<th>Publisher Phone: </th>
										<td><input value="${publisher.phone}" name="publishers[0].phone" size="50"/></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>	
					<br>
					<div>
						<h3>Category info </h3>
						<table class="tg">
							<tbody>
								<tr>
									<th>Category: </th>
									<td><form:input path="category.name" size="50"/></td>
								</tr>
								<tr>
									<th>Category Description: </th>
									<td><form:textarea path="category.description" rows="5" cols="50"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
				<input type="submit" value="Save" class="add-button"/>			
			</form:form>			
		</div>
	</body>
</html>