<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Insert title here</title>
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
		<h1>Rent Books</h1>
		
		<div>
			<h2>Member: ${member.memberName} ${member.memberSurename} ${member.memberClass} </h2>
		</div>
		<br><hr><br>
		<%@include file="navigation.jsp" %>
		<br><br><hr><br><br><br>
		<form action="rent" method="GET">
			<input type="hidden" name="memberId" value="${member.memberId}"/>
			 <!-- Book table -->    
		    <div style=" float: left; width: 80%; margin: 0 10% 10% 10%">
				<table class="tg">
			
			        <tr>
			            <th width="8%">Book Title</th>
			            <th width="8%">Book Author</th>
			            <th width="8%">Book Publisher</th>
			            <th width="8%">Book Category</th>			             
	            		<th width="8%">Available</th>
			            <th width="8%">Check books for rent</th>
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
			       				<c:if test="${book.numberOfCopies > 0}">
			                    	<td>Available</td>
			                   	</c:if>
			                   	<c:if test="${book.numberOfCopies <= 0}">
			                   		<td style="color: red">Not available</td>
			                   	</c:if>
			                    <td style="text-align: center;">
				                    <input type="checkbox" name="bookForRent" value="${book.bookId}">
				                 </td>
			                </tr>
			            </c:forEach>
			        </c:if>		
			    </table>
			    <br>
			    <div style="float: right">
			    	<input type="submit" value="Rent" class="add-button"/>
			    </div>
		    </div>
	    </form>
	   
	</body>
</html>