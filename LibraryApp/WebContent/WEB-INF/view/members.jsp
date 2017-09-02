<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Member List</title>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
		
		 <!-- JavaScript -->
			  
	 	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
	 
	  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	   	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		
	<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			$("#search").autocomplete({

				source : function(request, response) {
					$.ajax({
						url : "${pageContext.request.contextPath}/member/search",
						type : "GET",
						data : {
							term : request.term
						},
						dataType : "json",
						success : function(data) {
							response(data);
						}
					});
				}
			});
			
			$('#search').bind('keyup', function(e) {

			    if ( e.keyCode === 13 ) { // 13 is enter key
			    	
			    	$(this).closest('form').submit();
			    }

			});
		});
	});
	</script>
	</head>
	<body>
		<h1>Members</h1>
 		<br><hr><br>
			<%@include file="navigation.jsp" %>
			 <div style=" float: right;">
			 	<!-- button: Add Member -->    
   				 <input type="button" 
			    	   value="Add Member" 
			    	   onclick="window.location.href='showFormForAdd'; return false;" 
			    	   class="add-button"/>
			 </div>
			 <br><br><hr><br> 
			 
			 <div>
			    <label>Search: </label>
						<form:form action="searchByName" method="POST">
			<input  name= "search" id="search" placeholder="Search" size="50"/> 
	</form:form>
			    <br><br>
	    	 </div>	  
    
    	<!-- Member table --> 
    	<div style=" float: left; width: 80%; margin: 0 10% 10% 10%">   
		    <table class="tg">
		        <tr>
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
		       			<!-- Create an rent/return link with member id -->
		       			<c:url var="returnBook" value="/member/returnBook">
		       				<c:param name="memberId" value="${member.memberId}"/>
		       			</c:url>
		       			<c:url var="rentBook" value="/member/rentBook">
		       				<c:param name="memberId" value="${member.memberId}"/>
		       			</c:url>
		                
		                <tr>
		                    <td>${member.memberName}</td>
		                    <td>${member.memberSurename}</td>
		                    <td>${member.memberAddress}</td>
		                    <td>${member.memberPhone}</td>
		                    <td>${member.memberActivity}</td>
		                    <td>${member.memberClass}</td>
		                    <td>
		                    	<a href="${returnBook}">Return</a> | 
		                    	<a href="${rentBook}">Rent</a>
		                    </td>
		                    <td><a href="${updateLink}">Update</a> | 
		                    	<a href="${deleteLink}" 
		                    	onclick="if(!(confirm('Are you sure you want to delete this MEMBER?'))) return false"
		                    	>Delete</a></td>
		                </tr>
		            </c:forEach>
		        </c:if>
		    </table>
		</div>
	</body>	
</html>