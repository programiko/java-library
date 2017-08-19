<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>List Administrators</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>List Administrators</h1>
 
    <br>
    <h3>Administrator List</h3>
  
    <table class="tg">
        <tr>
            <th width="80">Administrator ID</th>
            <th width="120">Administrator Username</th>
            <th width="120">Administrator Password</th>
         
        </tr>
       	<c:if test="${!empty admins}">
            <c:forEach items="${admins}" var="getbyid">
                <tr>
                    <td>${administrator.administratorid}</td>
                    <td>${administrator.administratorusername}</td>
                    <td>${administrator.administratorpassword}</td>
                </tr>
            </c:forEach>
            </c:if>
    </table>
		 <p>
			<a href="${pageContext.request.contextPath}/admin/administrators">Back to List</a>
		</p>
	
</body>
</html>