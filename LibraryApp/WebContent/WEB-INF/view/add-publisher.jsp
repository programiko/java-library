<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Publisher</title>
</head>
<body>

<div id="container">
<h3>Save publisher</h3>

<form:form action="addPublisher" modelAttribute="publisher" method="POST">
<form:hidden path="id"/>
<table>
<tbody>
<tr>
<td><label>Name:</label></td>
<td><form:input path="name"/></td>
</tr>
<tr>
<td><label>Address:</label></td>
<td><form:input path="address"/></td>
</tr>
<tr>
<td><label>Phone:</label></td>
<td><form:input path="phone"/></td>
</tr>
<tr>
<td><label></label></td>
<td><input type="submit" value="Save" class="save"/></td>
</tr>
</tbody>
</table>

</form:form>
<div style="clear; both"></div>

<!-- Link >> publishers.jsp -->
<p>
<a href="${pageContext.request.contextPath }/publisher/publishers">Back to Publishers list</a>
</p>
</div>
</body>
</html>