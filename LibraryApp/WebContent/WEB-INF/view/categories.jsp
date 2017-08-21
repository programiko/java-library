<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Category List</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
		.add-button {
			border: 1px solid #666; 
			border-radius: 5px; 
			padding: 4px; 
			font-size: 12px;
			font-weight: bold;
			width: 120px; 
			padding: 5px 10px; 		
			margin-bottom: 15px;
		}
		</style>
</head>
<body>
 <input type="button" 
    	   value="Add Category" 
    	   onclick="window.location.href='AddingForm'; return false;" 
    	   class="add-button"/>

<table class="tg">
        <tr>
            <th width="80">Category ID</th>
            <th width="120">Category Name</th>
            <th width="120">Category description</th>
            <th width="60">Update</th>
            <th width="60">Delete</th>
        </tr>
        <c:if test="${!empty listCategories}">
            <c:forEach items="${listCategories}" var="category">
           <c:url var="updateLink" value="/category/UpdatingForm">
       				<c:param name="updateCategory" value="${category.id}"/>
       			</c:url> 
       			<c:url var="deleteLink" value="/category/DeletingForm">
       				<c:param name="deleteCategory" value="${category.id}"/>
       			</c:url>     
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>${category.description}</td>
                    <td><a href="${updateLink}">Update</a> </td> 
                    <td><a href="${deleteLink}" 
                    	onclick="if(!(confirm('Are you sure you want to delete this category?'))) return false"
                    	>Delete</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
         <p>
			<a href="${pageContext.request.contextPath}">Back to List</a>
		</p>

</body>
</html>