<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css"
rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>List of Publishers</title>
</head>
<body>
<input type="button" value="Add Publisher" onclick="window.location.href='showFormForAddPublisher';return false;"
class="add-button"/>

<!-- --------------------------------------------------------------------------------------------- -->
<table class="tg">
 <tr>    
            <th width="170">Name</th>
            <th width="190">Address</th>  
            <th width="120">Phone</th>
            <th width="120">Action</th>
        </tr> 

<c:forEach var="tempPublisher" items="${publisher }">

<!-- Update -->
<c:url var="updateLink" value="/publisher/showFormForUpdatePublisher">
<c:param name="id" value="${tempPublisher.id }"/>
</c:url>

<!-- Delete -->
<c:url var="deleteLink" value="/publisher/deletePublisher">
<c:param name="id" value="${tempPublisher.id }"/>
</c:url>

<tr>
<td>${tempPublisher.name }</td>
<td>${tempPublisher.address }</td>
<td>${tempPublisher.phone }</td>

<!-- Display the update link -->
<td><a href="${updateLink }">Update</a>
|
<a href="${deleteLink }" 
onclick="if (!(confirm('Are you sure you want to delete this PUBLISHER?'))) return false"
>Delete</a>
</td>
</tr>
</c:forEach>

</table>
<p>
<a href="${pageContext.request.contextPath }/">Back to Home page</a>
</p>
</body>
</html>