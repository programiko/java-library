<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Book List</title>
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
						url : "${pageContext.request.contextPath}/book/search",
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
		<h1>Books</h1> 
	    <br><hr><br>
			<%@include file="navigation.jsp" %>
			 <div style=" float: right;">
			    <!-- add book button -->
			    <input type="button" 
			    	   value="Add Book" 
			    	   onclick="window.location.href='showFormForAdd'; return false;" 
			    	   class="add-button"/>
	    	</div>
	    <br><br>
	    <hr>
	    <br>

	    <div>
		    <label>Search: </label>
		<form:form action="searchByName" method="POST" >
			<input  name= "search" id="search" placeholder="Search" size="50"/> 
	</form:form>
			    <br><br>
	    </div>	      
	
	    <!-- Book table -->    
	    <div style=" float: left; width: 80%; margin: 0 10% 10% 10%">
			<table class="tg">
		
		        <tr>
		            <th width="8%">Book Title</th>
		            <th width="8%">Book Author</th>
		            <th width="8%">Book Publisher</th>
		            <th width="8%">Book Category</th>
		            <th width="3%">Number Of Pages</th>  
		            <th width="3%">Number Of Copies</th>
		            <th width="3%">Number Of Rented Books</th>
		            <th width="3%">Book Rating</th>
		            <th width="8%">Book Location</th>
		            <th width="8%">Action</th>
		        </tr>        
		        <c:if test="${!empty listBooks}">
		            <c:forEach var="book" items="${listBooks}">
		         
		        		<!-- Create a update link with book id  -->
						<c:url var="updateLink" value="/book/showFormForUpdate">	
							<c:param name="bookId" value="${book.bookId}"/>
							
							<c:param name="categoryId" value="${book.category.id}"/>
							 
							<c:forEach var="auto" items="${book.authors}">
				               <c:param name="authorsId" value="${auto.authorsId}"/>
				            </c:forEach>
				            
				            <c:forEach var="publ" items="${book.publishers}">	             
				               <c:param name="publishersId" value="${publ.id}"/>
				           </c:forEach>
						</c:url>
						
						<!-- Create a delete link with book id  -->
						<c:url var="deleteLink" value="/book/deleteBook">
							<c:param name="bookId" value="${book.bookId}"/>
						</c:url> 
		                
		                <tr>
		                    <td>${book.bookTitle}</td>
		                    <td>
		                    	<c:if test="${!empty book.authors}">
				            		<c:forEach var="auto" items="${book.authors}">
				                    	${auto.authorsName} 
				                    	${auto.authorsSurname}<br>
				                    </c:forEach>
			       				</c:if>
		                    </td>
		                    <td>
			                    <c:if test="${!empty book.publishers}">
					            	<c:forEach var="publ" items="${book.publishers}">
					            		${publ.name} <br>
					                </c:forEach>
			       				</c:if>
		       				</td>
		       				<td>${book.category.name}</td>
		                    <td>${book.numberOfPages}</td>
		                    <td>${book.numberOfCopies}</td>
		                    <td>${book.numberOfRentedBook}</td>
		                    <td>${book.bookRating}</td>
		                    <td>${book.bookLocation}</td>
		                    <td><a href="${updateLink}&update=update">Update</a> | 
		                    	<a href="${deleteLink}"
		                    	   onclick="if(!(confirm('Are you sure you want to delete this BOOK?'))) return false"
		                    	>Delete</a></td>
		                </tr>
		            </c:forEach>
		        </c:if>
		
		    </table>
	    </div>
	</body>	
</html>