<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Debits</title>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
		<h1>List Debits</h1>
 		<br><hr><br>
		<%@include file="navigation.jsp" %> 
		
		 <br><br><hr><br> 
		
		 <div>
			<label>Search: </label>
			<input type="text" name="search" placeholder="Search" size="50"/> 
			<br><br>
	     </div>
         <div style=" float: left; width: 80%; margin: 0 10% 10% 10%">
		    <!-- Debits table -->    
		    <table class="tg">
		        <tr>
		            <th width="8%">Date of debit</th>  
		            <th width="8%">Note</th>
		            <th width="8%">Member Name</th>
		            <th width="8%">Member Class</th>
		            <th width="8%">Book Title</th>
		            <th width="8%">Book Category</th>
		            <th width="8%">Book Author</th>
		            <th width="8%">Book Publisher</th>            
		            <th width="8%">Action</th>
		        </tr>        
		        <c:if test="${!empty listDebits}">
		            <c:forEach var="debit" items="${listDebits}">
		                <tr>
		                    <td>${debit.dateOfDebit}</td>
		                    <td>${debit.note}</td>
		                    <td>
		                    	${debit.member.memberName} 
		                    	${debit.member.memberSurename}
		                    </td>
		                    <td>${debit.member.memberClass}</td>
		                    <td>${debit.book.bookTitle}</td>
		                    <td>${debit.book.category.name}</td>
		                    <td>
		                    	<c:if test="${!empty debit.book.authors}">
				            		<c:forEach var="auto" items="${debit.book.authors}">
				                    	${auto.authorsName} 
				                    	${auto.authorsSurname}
				                	</c:forEach>
				                </c:if>
		                    </td>
		                    <td>
		                    	<c:if test="${!empty debit.book.publishers}">
				            		<c:forEach var="publ" items="${debit.book.publishers}">
				                    	${publ.name}
				                    </c:forEach>
			       				</c:if>
		                    </td>
		                    <td><a>Return</a></td>
		                </tr>
		            </c:forEach>
		        </c:if>
		    </table>
		</div>
	</body>	
</html>