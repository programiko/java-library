<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User View</title>
<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
   <div style=" float: left; width: 65%;"> 
    	<br>	 
	    <label>Search: </label>
	    <input type="text" name="search" placeholder="Search" size="50"/> 
	    <br><br>
		<table class="tg" style="align-content: center">
	
	        <tr>
	            <th width="8%">Book Title</th>
	            <th width="8%">Book Author</th>
	            <th width="8%">Book Publisher</th>
	            <th width="8%">Book Category</th>
	            <th width="8%">Number Of Pages</th>  
	            <th width="8%">Number Of Copies</th>
	            <th width="3%">Book Rating</th>
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
	                    <td>${book.numberOfCopies}</td>
	                    <td>${book.bookRating}</td>
	            </c:forEach>
	        </c:if>
	
	    </table> 
    </div>
    <div style=" float: right; width: 25%; align-content: center">
    	<h3>Highest rated</h3>
	    <table class="tg" style="">	
	        <tr>
	            <th width="8%">Book Title</th>
	            <th width="8%">Book Category</th>
	            <th width="3%">Book Rating</th>
	        </tr>                 
	        <tr>
	            <td>${book.bookTitle}</td>
	       		<td>${book.category.name}</td>
	            <td>${book.bookRating}</td>
	        </tr>
	    </table>
	  </div>
	  <div style="float:right ; width:55% ; align-content: center">
	  <p><a href="${pageContext.request.contextPath}">Back to main page</a></p>
	  </div>

</body>
</html>