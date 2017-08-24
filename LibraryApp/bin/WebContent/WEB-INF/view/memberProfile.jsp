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
		<h2>Member: ${member.memberName} ${member.memberSurename}</h2>
		<table>
			<tr>
				<td>ID:</td>
				<td>${member.memberId}</td>
			</tr>
			<tr>
				<td>Name:</td>
				<td>${member.memberName}</td>
			</tr>
			<tr>
				<td>Surname:</td>
				<td>${member.memberSurename}</td>
			</tr>
			<tr>
				<td>Address:</td>
				<td>${member.memberAddress}</td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td>${member.memberPhone}</td>
			</tr>
			<tr>
				<td>Activity:</td>
				<td>${member.memberActivity}</td>
			</tr>
			<tr>
				<td>Class:</td>
				<td>${member.memberClass}</td>
			</tr>
		</table>

		<c:url var="booksForRentForm" value="/admin/booksForRentForm">
			<c:param name="memberId" value="${member.memberId}" />
		</c:url>

		<div>
			<p>
				<a href="${booksForRentForm}"><input type="button"
					value="Rent Books" class="add-button"></a>
			</p>

		</div>
		<!-- Debits table -->
		<table class="tg">
			<tr>
				<th width="5%">Debits ID</th>
				<th width="10%">Date of debit</th>
				<th width="10%">Note</th>
				<th width="5%">Book ID</th>
				<th width="10%">Book Title</th>
				<th width="10%">Book Author</th>
				<th width="10%">Book Publisher</th>
				<th width="5%">Action</th>
			</tr>
			<c:if test="${!empty member.debits}">
				<c:forEach var="debit" items="${member.debits}">
					<tr>
						<td>${debit.debitsId}</td>
						<td>${debit.dateOfDebit}</td>
						<td>${debit.note}</td>
						<td>${debit.book.bookId}</td>
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
						<td><a>Return</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div>
			<p>
				<a href="${pageContext.request.contextPath}/member/members">Back to members</a>
			</p>
		</div>
	</div>
</body>
</html>