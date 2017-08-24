<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Member List</title>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
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
            <th width="5%">Member ID</th>
            <th width="15%">Member Name</th>
            <th width="15%">Member Surname</th>  
            <th width="15%">Member Address</th>
            <th width="10%">Member Phone</th>
            <th width="5%">Member Activity</th>
            <th width="5%">Member Class</th>
            <th width="15%">Profile</th>
            <th width="15%">Action</th>
        </tr>        
        <c:if test="${!empty listMembers}">
            <c:forEach var="member" items="${listMembers}">
        
        		<!-- Create an update and delete link with member id -->
       			<c:url var="updateLink" value="/member/showFormForUpdate">
       				<c:param name="memberId" value="${member.memberId}"/>
       			</c:url>       			
       			<c:url var="deleteLink" value="/member/deleteMember">
       				<c:param name="memberId" value="${member.memberId}"/>
       			</c:url>
       			<!-- Create an view profile link with member id -->
       			<c:url var="viewProfile" value="/member/viewProfile">
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
                    <td><a href="${viewProfile}">View Profile</a></td>
                    <td><a href="${updateLink}">Update</a> | 
                    	<a href="${deleteLink}" 
                    	onclick="if(!(confirm('Are you sure you want to delete this member?'))) return false"
                    	>Delete</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
    <div>
		<p><a href="${pageContext.request.contextPath }/main-page">Back to Home page</a></p>
	</div>
		</body>	
</html>