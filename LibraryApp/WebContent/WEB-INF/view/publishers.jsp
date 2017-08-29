<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
		<title>List of Publishers</title>
		
				  <!-- JavaScript -->
			  
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
			  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
			<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
	 

	 
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			$("#search").autocomplete({

				source : function(request, response) {
					$.ajax({
						url : "${pageContext.request.contextPath}/publisher/search",
						type : "GET",
						data : {
							term : request.term
						},
						dataType : "json",
						success : function(data) {
							response(data);
						}
					});
				}
			});
			
			$('#search').bind('keyup', function(e) {

			    if ( e.keyCode === 13 ) { // 13 is enter key
			    	
			    	$(this).closest('form').submit();
			    }

			});
		});
	});
	</script>
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
					<form:form action="searchByName" method="POST">
			<input  name= "search" id="search" placeholder="Search" size="50"/> 
	</form:form>
			<br><br>
	     </div>	
	
		<div style=" float: left; width: 80%; margin: 0 10% 10% 10%">		
			<table class="tg" >
				 <tr>    
				 	<th width="10%">ID</th>
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
						<td>${tempPublisher.id }</td>
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