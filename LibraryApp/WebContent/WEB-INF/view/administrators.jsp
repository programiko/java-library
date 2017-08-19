<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>List Administrators</title>
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
</style>
</head>
<body>
    <h1>List Administrators</h1>
 <!-- button: Add Administrator -->
    
    <input type="button" 
    	   value="Add Administrator" 
    	   onclick="window.location.href='showFormForAdd'; return false;" 
    	   class="add-button"/>
    
    <br>
    <h3>Administrator List</h3>
    <form:form action="search" method="POST" modelAttribute="searchAdmin">
                Search for an Administrator: <input type="text" name="adminId" />
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