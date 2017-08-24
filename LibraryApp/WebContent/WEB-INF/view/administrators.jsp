<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>List Administrators</title>
<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <h1>List of Administrators</h1>
 <!-- button: Add Administrator -->
    
    <input type="button" 
    	   value="Add Administrator" 
    	   onclick="window.location.href='showFormForAdd'; return false;" 
    	   class="add-button"/>
    	   
    	   <input type="button" 
    	   value="Check Administrator" 
    	   onclick="window.location.href='showFormForCheck'; return false;" 
    	   class="add-button"/>
    
    <br>
    <h3>Administrator List's</h3>
    <form:form action="search" method="POST" modelAttribute="searchAdmin">
                Search for an Administrator: 
                <input type="text" name="adminId" />
                <input type="submit" value="Search" class="add-button" />
            </form:form>
            
      		  			
            
    <table class="tg">
        <tr>
            <th width="80">Administrator ID</th>
            <th width="120">Administrator Username</th>
            <th width="120">Administrator Password</th>
            <th width="60">Update</th>
            <th width="60">Delete</th>
        </tr>
        <c:if test="${!empty listAdministrators}">
            <c:forEach items="${listAdministrators}" var="administrator">
           <c:url var="updateLink" value="/admin/showFormForUpdate">
       				<c:param name="adminId" value="${administrator.id}"/>
       			</c:url> 
       			<c:url var="deleteLink" value="/admin/showFormForDelete">
       				<c:param name="adminId" value="${administrator.id}"/>
       			</c:url>     
                <tr>
                    <td>${administrator.id}</td>
                    <td>${administrator.username}</td>
                    <td>${administrator.password}</td>
                    <td><a href="${updateLink}">Update</a> </td> 
                    <td><a href="${deleteLink}" 
                    	onclick="if(!(confirm('Are you sure you want to delete this administrator?'))) return false"
                    	>Delete</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
 <div>
				<p>
				<a href="${pageContext.request.contextPath}">Back to root page</a></p>
			</div>
</body>
</html>