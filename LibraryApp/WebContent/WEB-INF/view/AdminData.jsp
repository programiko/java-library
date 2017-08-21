<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
 
    <br>
    <h3>Administrator List</h3>
  
    <table class="tg">
        <tr>
            <th width="80">Administrator ID</th>
            <th width="120">Administrator Username</th>
            <th width="120">Administrator Password</th>
         
        </tr>
       	<c:if test="${!empty admins}">
            <c:forEach items="${admins}" var="admins">
                <tr>
                    <td>${admins.id}</td>
                    <td>${admins.username}</td>
                    <td>${admins.password}</td>
                </tr>
            </c:forEach>
            </c:if>
    </table>
		 <p>
			<a href="${pageContext.request.contextPath}/admin/administrators">Back to List</a>
		</p>
	
</body>
</html>