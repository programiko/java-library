<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Rent Books</title>
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
		<h3>Choose books for ${member.memberName} ${member.memberSurename}</h3>
		<table class="tg">
			<tr>
				<th width="120">Book ID</th>
		        <th width="120">Book Title</th>
		        <th width="120">Book Author</th>
		        <th width="120">Book Publisher</th>
			    <th width="120">Rent book</th>
			</tr>  
			<tr>
		        <td>Book ID</td>
		        <td>Book Title</td>
		        <td>Book Author</td>
		        <td>Book Publisher</td>
		        <td><input type="checkbox"></td>
	        </tr> 
	            
		</table>
		<div>
			<c:url var="rentBooks" value="/admin/rentBooks">
       				<c:param name="memberId" value="${member.memberId}"/>
       		</c:url>
       		<c:url var="backToMemberProfile" value="/admin/backToMemberProfile">
       				<c:param name="memberId" value="${member.memberId}"/>
       		</c:url>
			<a href="${rentBooks}">			
				<input type="button" value="Rent" class="add-button"/>
			</a>
			<a href="${backToMemberProfile}"><input type="button" value="Cancle" class="add-button"/></a>
		</div>
	</body>
</html>