<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
	<head>
		<title>List Authors</title>
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
						url : "${pageContext.request.contextPath}/author/search",
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
	    <h1>Authors</h1>
	 	<br><hr><br>
		<%@include file="navigation.jsp" %>
		<div style=" float: right;">	   
	   		<input type="button" 
			   	   value="Add Author" 
			   	   onclick="window.location.href='showFormAddAuthors'; return false;" 
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
		            <th width="10%">Authors Name</th>
		            <th width="10%">Authors Surname</th> 
					<th width="10%">View books</th>          
		            <th width="10%">Action</th>
		        </tr>
		        <c:if test="${!empty listAuthors}">
		            <c:forEach var="authors" items="${listAuthors}">
		        
		        		<!-- Create an update and delete link with authors id -->
		       			<c:url var="updateLink" value="/author/showFormForUpdateAuthors">
		       				<c:param name="authorsId" value="${authors.authorsId}"/>
		       			</c:url>       			
		       			<c:url var="deleteLink" value="/author/delete">
		       				<c:param name="authorsId" value="${authors.authorsId}"/>
		       			</c:url>
		       			
		       			<!-- Book Link -->
		       			<c:url var="bookLink" value="/book/booksOfAutor">
		       				<c:param name="authorId" value="${authors.authorsId}"/>
		       			</c:url>
		                <tr>
		                    <td>${authors.authorsName}</td>
		                    <td>${authors.authorsSurname}</td>
		                    <td><a href="${bookLink}">Books</a></td>
		                    <td>
		                    	<a href="${updateLink}">Update</a> | 
		                    	<a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this AUTHOR?'))) return false">Delete</a>
		                    </td>
		                </tr>
		            </c:forEach>
		        </c:if>
		    </table>
		</div>	 
	</body>
</html>