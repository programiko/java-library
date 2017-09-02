<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Member Profile</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div>		
		<div  style="float: left">
			<h2>Member: ${member.memberName} ${member.memberSurename} ${member.memberClass}</h2>
		</div>
		<br><br><br><br><hr><br>
		<%@include file="navigation.jsp" %>
		<br><br><hr><br>
		<table class="tg">
			<tr>
				<th>ID:</th>
				<td>${member.memberId}</td>
			</tr>
			<tr>
				<th>Name:</th>
				<td>${member.memberName}</td>
			</tr>
			<tr>
				<th>Surname:</th>
				<td>${member.memberSurename}</td>
			</tr>
			<tr>
				<th>Address:</th>
				<td>${member.memberAddress}</td>
			</tr>
			<tr>
				<th>Phone:</th>
				<td>${member.memberPhone}</td>
			</tr>
			<tr>
				<th>Activity:</th>
				<td>${member.memberActivity}</td>
			</tr>
			<tr>
				<th>Class:</th>
				<td>${member.memberClass}</td>
			</tr>
		</table>
		<!-- Debits table -->
		<div style=" float: left; width: 80%; margin: 0 10% 10% 10%" align="center"> 	
			<h3>Debits </h3> 
		    <table class="tg">
		    
		    	<!-- Create a rent link with book id  -->
				<c:url var="returnLink" value="/member/returnLink">
					<c:param name="memberId" value="${member.memberId}"/>					
					<c:forEach var="debit" items="${member.debits}">
						<c:param name="debitsId" value="${debit.debitsId}"/>
					</c:forEach>
				</c:url>
				  
				<tr>
					<th width="10%">Date of debit</th>
					<th width="10%">Note</th>
					<th width="10%">Book Title</th>
					<th width="10%">Book Author</th>
					<th width="10%">Book Publisher</th>
					<th width="5%">Action</th>
				</tr>
				<c:if test="${!empty member.debits}">
					<c:forEach var="debit" items="${member.debits}">
						<tr>
							<td>${debit.dateOfDebit}</td>
							<td>${debit.note}</td>
							<td>${debit.book.bookTitle}</td>
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
							<td><a href="${returnLink}">Return</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
				
		</div>
	</div>
</body>
</html>