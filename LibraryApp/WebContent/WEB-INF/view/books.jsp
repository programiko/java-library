<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Book List</title>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
		<h1>List Books</h1> 
    <br>
    <h3>Book List</h3>
    
    <!-- add book button -->
    <input type="button" 
    	   value="Add Book" 
    	   onclick="window.location.href='showFormForAdd'; return false;" 
    	   class="add-button"/>
    	      
    <!-- Member table -->    
    <table class="tg">
        <tr>
            <th width="3%">Book ID</th>
            <th width="8%">Book Title</th>
            <th width="8%">Book Author</th>
            <th width="8%">Book Publisher</th>
            <th width="8%">Number Of Pages</th>  
            <th width="8%">Number Of Copies</th>
            <th width="8%">Number Of Renting</th>
            <th width="3%">Number Of Rented Books</th>
            <th width="3%">Book Rating</th>
            <th width="8%">Book Location</th>
            <th width="8%">Action</th>
        </tr>        
        <c:if test="${!empty listBooks}">
            <c:forEach var="book" items="${listBooks}">
         
        		Create an update and delete link with book id
       			<c:url var="updateLink" value="/book/showFormForUpdate">
       				<c:param name="bookId" value="${book.bookId}"/>
       			</c:url>       			
       			<c:url var="deleteLink" value="/book/deleteMember">
       				<c:param name="bookId" value="${book.bookId}"/>
       			</c:url> 
                
                <tr>
                    <td>${book.bookId}</td>
                    <td>${book.bookTitle}</td>
                    <td></td>
                    <td>${book.publisher.name}</td>
                    <td>${book.numberOfPages}</td>
                    <td>${book.numberOfCopies}</td>
                    <td>${book.numberOfRenting}</td>
                    <td>${book.numberOfRentedBook}</td>
                    <td>${book.bookRating}</td>
                    <td>${book.bookLocation}</td>
                    <td><a>Update</a> | 
                    	<a>Delete</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
    <div>
		<p><a href="${pageContext.request.contextPath}/">Back to Home page</a></p>
	</div>
		</body>	
</html>