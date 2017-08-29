<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Category List</title>
		<link type="text/css"
			  rel="stylesheet"
			  href="${pageContext.request.contextPath}/resources/css/style.css" />
			  
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
						url : "${pageContext.request.contextPath}/category/search",
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
		<h1>Categories</h1>
	 	<br><hr><br>
		<%@include file="navigation.jsp" %>
		<div style=" float: right;">
	 		<input type="button" 
	    	   value="Add Category" 
	    	   onclick="window.location.href='AddingForm'; return false;" 
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
			<table class="tg">
		        <tr>
		            <th width="10%">Category ID</th>
		            <th width="10%">Category Name</th>
		            <th width="10%">Category description</th>
				    <th width="10%">View books</th> 
		            <th width="10%">Action</th>
		        </tr>
		        <c:if test="${!empty listCategories}">
		            <c:forEach items="${listCategories}" var="category">
		         <!-- Update Link -->
		        <c:url var="updateLink" value="/category/UpdatingForm">
		       		<c:param name="updateCategory" value="${category.id}"/>
		       	</c:url> 
		       	<!-- Delete Link -->
		       	<c:url var="deleteLink" value="/category/DeletingForm">
		       		<c:param name="deleteCategory" value="${category.id}"/>
		       	</c:url>  
		       	<!-- Book Link -->
		       	<c:url var="bookLink" value="/book/booksOfCategory">
		       		<c:param name="categoryId" value="${category.id}"/>
		       	</c:url>      
		                <tr>
		                    <td>${category.id}</td>
		                    <td>${category.name}</td>
		                    <td>${category.description}</td>
							<td><a href="${bookLink}">Books</a></td>
		                    <td>
			                    <a href="${updateLink}">Update</a> |
			                    <a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this category?'))) return false">Delete</a>
		                    </td>
		                </tr>
		            </c:forEach>
		        </c:if>
	    	</table>
		</div>

	</body>
</html>