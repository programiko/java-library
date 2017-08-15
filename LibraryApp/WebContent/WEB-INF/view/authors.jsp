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
    <h1>List Authors</h1>
 
    <br>
    <h3>Authors List</h3>
    <table class="tg">
        <tr>
            <th width="80">Authors ID</th>
            <th width="120">Authors Name</th>
            <th width="120">Authors Surname</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:if test="${!empty listAuthors}">
            <c:forEach items="${listAuthors}" var="authors">
                <tr>
                    <td>${authors.authorsId}</td>
                    <td>${authors.authorsName}</td>
                    <td>${authors.authorsSurname}</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
 
</body>
</html>