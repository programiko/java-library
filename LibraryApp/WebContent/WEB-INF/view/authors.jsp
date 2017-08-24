<%@ page contentType = "text/html; charset = UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>List Authors</title>
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
    <br>
    <input type="button" value="AddAuthors" onclick="window.location.href='showFormAddAuthors'; return false;"
    class="add-button"/> 
    <br><br>
    <table class="tg">
        <tr>
            <th width="10%">Authors ID</th>
            <th width="10%">Authors Name</th>
            <th width="10%">Authors Surname</th>            
            <th width="10%">Action</th>
        </tr>
        <c:if test="${!empty listAuthors}">
            <c:forEach var="authors" items="${listAuthors}">
        
        		<!-- Create an update and delete link with authors id -->
       			<c:url var="updateLink" value="/author/showFormForUpdateAuthors">
       				<c:param name="authorsId" value="${authors.authorsId}"/>
       			</c:url>       			
       			<c:url var="deleteLink" value="/author/delete">
       				<c:param name="authorsId" value="${authors.authorsId}"/>
       			</c:url>
       			
       			<!-- Book Link -->
       			<c:url var="bookLink" value="/book/booksOfAutor">
       				<c:param name="authorId" value="${authors.authorsId}"/>
       			</c:url>
                <tr>
                    <td>${authors.authorsId}</td>
                    <td>${authors.authorsName}</td>
                    <td>${authors.authorsSurname}</td>
                     <td><a href="${updateLink}">Update</a> | 
                    	<a href="${deleteLink}" 
                    	onclick="if(!(confirm('Are you sure you want to delete this Authors?'))) return false"
                    	>Delete</a>
                    	|
                    	<a href="${bookLink}">Books</a>
                    	</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
    
    <div>
		<p><a href="${pageContext.request.contextPath }/main-page">Back to Home page</a></p>
	</div>
 
</body>
</html>