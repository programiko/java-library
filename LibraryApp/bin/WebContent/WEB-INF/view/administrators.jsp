<%@ page contentType = "text/html; charset = UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
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
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:if test="${!empty listAdministrators}">
            <c:forEach items="${listAdministrators}" var="administrator">
                <tr>
                    <td>${administrator.id}</td>
                    <td>${administrator.username}</td>
                    <td>${administrator.password}</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
 
</body>
</html>