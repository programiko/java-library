<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<title>LIBRARY</title>
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
	<div style="float: left"><h1>LIBRARY</h1> </div>
    <div align="right">
    	<form:form action="admin/checkAdmin" method="POST" name="Form" >
    		<table>
    			<tr>
    				<td><label>Username: </label></td>
    				<td><input type="text" name="username"/></td>
    			</tr>
    			<tr>
    				<td><label>Password: </label></td>
    				<td><input type="password" name="password"/></td>
    			</tr>
    		</table>
    		
    		 <input type="submit" value="LOG IN" name="formButton" id="forwardButton"/> 
    		 
   		</form:form> 
   		
   		 
    </div>
  
  <div style="float: right ; width: 25% ; color:red"">
  			${message}
  </div>
    <br><br><br>

    <!-- Books table --> 
    <div style=" float: left; width: 65%;"> 
    	<br>	 
	    <label>Search: </label>
		<form:form action="searchByNameStartPage" method="POST" >
			<input  name= "search" id="search" placeholder="Search" size="50"/> 
	</form:form>
	    <br><br>
		<table class="tg" style="align-content: center">
	
	        <tr>
	            <th width="8%">Book Title</th>
	            <th width="8%">Book Author</th>
	            <th width="8%">Book Publisher</th>
	            <th width="8%">Book Category</th>
	            <th width="8%">Number Of Pages</th>
	            <th width="3%">Book Rating</th>  
	            <th width="8%">Available</th>
	        </tr>        
	        <c:if test="${!empty listBooks}">
	            <c:forEach var="book" items="${listBooks}">          
	                <tr>
	                    <td>${book.bookTitle}</td>
	                    <td>
	                    	<c:if test="${!empty book.authors}">
			            		<c:forEach var="auto" items="${book.authors}">
			                    	${auto.authorsName} 
			                    	${auto.authorsSurname}
			                    </c:forEach>
		       				</c:if>
	                    </td>
	                    <td>
		                    <c:if test="${!empty book.publishers}">
			            		<c:forEach var="publ" items="${book.publishers}">
			                    	${publ.name}
			                    </c:forEach>
		       				</c:if>
	       				</td>
	       				<td>${book.category.name}</td>
	                    <td>${book.numberOfPages}</td>
	                    <td>${book.bookRating}</td>
	                    <c:if test="${book.numberOfCopies > 0}">
			               <td>Available</td>
			            </c:if>
			            <c:if test="${book.numberOfCopies <= 0}">
			            	<td style="color: red">Not available</td>
			            </c:if>
	            </c:forEach>
	        </c:if>
	
	    </table> 
    </div>
    <div style=" float: right; width: 25%; align-content: center">
    	<h3>Highest rated - Top 5</h3>
	    <table class="tg" style="">	
	        <tr>
	            <th width="8%">Book Title</th>
	            <th width="8%">Book Category</th>
	            <th width="3%">Book Rating</th>
	        </tr>    
	          <c:forEach var="book" items="${topBooks}" begin="0" end="4">             
	        <tr>
	            <td>${book.bookTitle}</td>
	       		<td>${book.category.name}</td>
	            <td>${book.bookRating}</td>
	        </tr>
	          </c:forEach>
	    </table>
	  </div>
    </body>	
</html>