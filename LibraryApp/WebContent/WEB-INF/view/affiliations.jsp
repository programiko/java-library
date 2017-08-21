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
<title>List of Affilitations</title>
</head>
<body>
<table class="tg">
 <tr>    
            <th width="170">Autor iD</th>
            <th width="190">Book iD</th>  
          
        </tr> 

<c:forEach var="tempAf" items="${affiliation }">

<tr>
<td>${tempAf.autorId }</td>
<td>${tempAf.bookId }</td>



</tr>
</c:forEach>

</table>
</body>
</html>