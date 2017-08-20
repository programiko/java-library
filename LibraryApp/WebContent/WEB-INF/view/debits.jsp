<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Debits List</title>
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
	</head>
	<body>
		<h1>List Debits</h1>
 
    <br>
    <h3>Debits List</h3>
        
    <!-- Debits table -->    
    <table class="tg">
        <tr>
            <th width="80">Debits ID</th>
            <th width="120">Date of debit</th>
            <th width="120">Return date</th>  
            <th width="120">Note</th>
            <th width="80">Action</th>
        </tr>        
        <c:if test="${!empty listDebits}">
            <c:forEach var="debit" items="${listDebits}">
                <tr>
                    <td>${debit.debitsId}</td>
                    <td>${debit.dateOfDebit}</td>
                    <td>${debit.returnDate}</td>
                    <td>${debit.note}</td>
                    <td><a>Return</a></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
    <div>
		<p><a href="${pageContext.request.contextPath}/">Back to Home page</a></p>
	</div>
		</body>	
</html>