<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Member Profile</title>
		<style type="text/css">
			.tg {
				border-collapse: collapse;
				border-spacing: 0;
				border-color: #ccc;
			}
			
			.tg td {
				font-family: Arial, sans-serif;
				font-size: 14px;
				padding: 10px 5px;
				border-style: solid;
				border-width: 1px;
				overflow: hidden;
				word-break: normal;
				border-color: #ccc;
				color: #333;
				background-color: #fff;
			}
			
			.tg th {
				font-family: Arial, sans-serif;
				font-size: 14px;
				font-weight: normal;
				padding: 10px 5px;
				border-style: solid;
				border-width: 1px;
				overflow: hidden;
				word-break: normal;
				border-color: #ccc;
				color: #333;
				background-color: #8FBC8F;
			}
			
			.tg .tg-4eph {
				background-color: #f9f9f9
			}
			.add-button {
				border: 1px solid #666; 
				border-radius: 5px; 
				padding: 4px; 
				font-size: 12px;
				font-weight: bold;
				width: 120px; 
				padding: 5px 10px; 		
				margin-bottom: 15px;
			}
		</style>
	</head>
	<body>
		<div>
			<h2>Member: ${member.memberName} ${member.memberSurename}</h2>
			<table>
				<tr>
					<td>ID: </td>
					<td>${member.memberId}</td>
				</tr>
				<tr>
					<td>Name: </td>
					<td>${member.memberName}</td>
				</tr>
				<tr>
					<td>Surname: </td>
					<td>${member.memberSurename}</td>
				</tr>
				<tr>
					<td>Address: </td>
					<td>${member.memberAddress}</td>
				</tr>
				<tr>
					<td>Phone: </td>
					<td>${member.memberPhone}</td>
				</tr>
				<tr>
					<td>Activity: </td>
					<td>${member.memberActivity}</td>
				</tr>
				<tr>
					<td>Class: </td>
					<td>${member.memberClass}</td>
				</tr>
			</table>
			
			<c:url var="booksForRentForm" value="/admin/booksForRentForm">
       				<c:param name="memberId" value="${member.memberId}"/>
       		</c:url>
			
			<div>
				<p><a href="${booksForRentForm}"><input type="button" value="Rent Books" class="add-button"></a></p>
				
			</div>
			<div>
				<h3>Rented books</h3>
				<table class="tg">
			        <tr>
			            <th width="120">Book ID</th>
	                    <th width="120">Book Title</th>
	                    <th width="120">Book Author</th>
	                    <th width="120">Book Publisher</th>
			            <th width="120">Return book</th>
			        </tr>  
			        
			        <!-- Create an view profile link with member id -->
	       			<c:url var="returnBook" value="/admin/returnBook">
	       				<c:param name="bookId" value=""/>
	       			</c:url>
			        <tr>
	                    <td>Book ID</td>
	                    <td>Book Title</td>
	                    <td>Book Author</td>
	                    <td>Book Publisher</td>
	                    <td><a href="${returnBook}">Return</a></td>
               		</tr>   
			     </table>   
			</div>
			<div>
				<p><a href="${pageContext.request.contextPath}/admin/members">Back to members</a></p>
			</div>
		</div>
	</body>
</html>