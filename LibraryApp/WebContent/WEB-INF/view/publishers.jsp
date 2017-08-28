<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
		<title>List of Publishers</title>
	</head>
	<body>
		<h1>Publishers</h1>
	 	<br><hr><br>
		<%@include file="navigation.jsp" %>
		<div style=" float: right;">	    
	   		<input type="button" 
			   	   value="Add Publisher" 
			   	   onclick="window.location.href='showFormForAddPublisher'; return false;" 
			   	   class="add-button"/>
		 </div>
		 <br><br><hr><br> 
		
		 <div>
			<label>Search: </label>
			<input type="text" name="search" placeholder="Search" size="50"/> 
			<br><br>
	     </div>	
	
		<div style=" float: left; width: 80%; margin: 0 10% 10% 10%">		
			<table class="tg" >
				 <tr>    
				    <th width="10%">Name</th>
				    <th width="10%">Address</th>  
				    <th width="10%">Phone</th>
				    <th width="10%">View books</th> 
				    <th width="10%">Action</th>
				 </tr> 
				
				<c:forEach var="tempPublisher" items="${publisher}">				
					<!-- Update -->
					<c:url var="updateLink" value="/publisher/showFormForUpdatePublisher">
					<c:param name="id" value="${tempPublisher.id}"/>
					</c:url>
					
					<!-- Delete -->
					<c:url var="deleteLink" value="/publisher/deletePublisher">
					<c:param name="id" value="${tempPublisher.id }"/>
					</c:url>
					
					<!-- Book Link -->
					<c:url var="bookLink" value="/book/booksOfPublisher">
					<c:param name="publisherId" value="${tempPublisher.id}"/>
					</c:url>
					
					<tr>
						<td>${tempPublisher.name }</td>
						<td>${tempPublisher.address }</td>
						<td>${tempPublisher.phone }</td>
						<td><a href="${bookLink}">Books</a></td>
						
						<!-- Display the update link -->
						<td>
							<a href="${updateLink }">Update</a> |		
							<a href="${deleteLink }" onclick="if (!(confirm('Are you sure you want to delete this PUBLISHER?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			
			</table>
		</div>
	</body>
</html>