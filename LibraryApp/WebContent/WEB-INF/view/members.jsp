<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Member List</title>
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
			<h1>List Members</h1>
 
    <br>
    <h3>Member List</h3>
    
    <!-- button: Add Member -->
    
    <input type="button" 
    	   value="Add Member" 
    	   onclick="window.location.href='showFormForAdd'; return false;" 
    	   class="add-button"/>
    
    <!-- Member table -->    
    <table class="tg">
        <tr>
            <th width="80">Member ID</th>
            <th width="120">Member Name</th>
            <th width="120">Member Surname</th>  
            <th width="120">Member Address</th>
            <th width="120">Member Phone</th>
            <th width="60">Member Activity</th>
            <th width="60">Member Class</th>
            <th width="120">Action</th>
        </tr>        
        <c:if test="${!empty listMembers}">
            <c:forEach var="member" items="${listMembers}">
        
        		<!-- Create an update and delete link with member id -->
       			<c:url var="updateLink" value="/admin/showFormForUpdate">
       				<c:param name="memberId" value="${member.memberId}"/>
       			</c:url>       			
       			<c:url var="deleteLink" value="/admin/delete">
       				<c:param name="memberId" value="${member.memberId}"/>
       			</c:url>
                
                <tr>
                    <td>${member.memberId}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberSurename}</td>
                    <td>${member.memberAddress}</td>
                    <td>${member.memberPhone}</td>
                    <td>${member.memberActivity}</td>
                    <td>${member.memberClass}</td>
                    <td><a href="${updateLink}">Update</a> | 
                    	<a href="${deleteLink}" 
                    	onclick="if(!(confirm('Are you sure you want to delete this member?'))) return false"
                    	>Delete</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
		</body>	
</html>



















