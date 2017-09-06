<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Save Book</title>
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
			
			<!-- dugme za dodavanje -->

 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

			 <!-- JavaScript -->
			  
	 	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
	 
	  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	   	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  		
	<script type="text/javascript">
	$(document).ready(function() {
		$(function() {
			$("#search").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "${pageContext.request.contextPath}/publisher/search",
						type : "GET",
						data : {
							term : request.term
						},
						
						dataType : "json",
						
						success : function(data) {
							
							response(data);
							
						
						}
					});
				}
			});
			
			$('#search').bind('click keyup', function(e) {

			    if ( e.keyCode === 13 || e.type === 'click') { // 13 is enter key
			      $.ajax({
			   	   type: "POST", 
			   	   dataType: "html", 
			   	   url: "${pageContext.request.contextPath}/publisher/sara", 
			   	   data: "name=" + $('#search').val(),
			   	   success: function(response){
			   		   var t = response;
			   		   var obj = JSON.parse(t);
			   		$('#example').val(obj.address);
			   	      $('#example1').val(obj.phone);
			   	   }
			   	});
			    }



			    });

			});
		});


	</script>
			
	</head>
	<body>
		<div style="float: left">
			<h2>Save Book</h2>
		</div>
		<!-- 
		<div style="float: right">
			<a href="${pageContext.request.contextPath}/book/books"><button class="add-button">Books</button></a>
		</div>
		 -->
		<br><br><br><br><hr><br>
		<%@include file="navigation.jsp" %>
		<br><br><hr><br><br><br>
		<div align="center">
			<form:form action="saveBook" modelAttribute="book" method="POST">	
					<form:hidden path="bookId"/>
					<form:hidden path="category.id"/>
									
					<div>
						<h3>Book info </h3>
						<table class="tg">
							<tbody>
								<tr>
									<th>Title: </th>
									<td><form:input path="bookTitle" size="50"/></td>
								</tr>	
								<tr>
									<th>Number of Pages: </th>
									<td><form:input path="numberOfPages" size="50" /></td>
								</tr>	
								<tr>
									<th>Number of Copies: </th>
									<td><form:input path="numberOfCopies" size="50"/></td>
								</tr>
								<tr>
									<th>Location: </th>
									<td><form:input path="bookLocation" size="50" /></td>
								</tr>	
							</tbody>
						</table>
					</div>
					<br>
					<div>
						<h3> Author info </h3>
						<table class="tg">
							<tbody id = "idAuthors">
								<c:if test="${!empty book.authors}">
									<c:forEach var="author" items="${book.authors}" varStatus="status">
										<form:hidden path="authors[${status.index}].authorsId"/>
										<tr >
											<th>Author Name: </th>
											<td><form:input path="authors[${status.index}].authorsName" size="50"/></td>
										</tr>
										<tr>
											<th>Author Surname: </th>
											<td><form:input path="authors[${status.index}].authorsSurname" size="50"/></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty book.authors}">
									<tr>
										<th>Author Name: </th>
										<td><input type="text" name="authors[0].authorsName" size="50" /></td>
									</tr>
									<tr>
										<th>Author Surname: </th>
										<td><input type="text" name="authors[0].authorsSurname" size="50"/></td>
									</tr>
										
								</c:if>
								
							</tbody>
						</table>
						<input type="button" onclick="addRowForAuthor()" value="Add Author" class="add-button"/>
						<input type="button" onclick="removeField('idAuthors')" value="Remove Author" class="remove-button" id="remove"/>
					</div>
					<br> 		
					<div>
						<h3>Publisher info </h3>
						<table class="tg">
							<tbody>
								<c:if test="${!empty book.publishers}">
									<c:forEach var="publisher" items="${book.publishers}" varStatus="status">
									<form:hidden path="publishers[${status.index}].id"/>
										<tr>
											<th>Publisher Name: </th>
											<td><form:input path="publishers[${status.index}].name" size="50"/></td>
										</tr>
										<tr>
											<th>Publisher Address: </th>
											<td><form:input path="publishers[${status.index}].address" size="50"/></td>
										</tr>
										<tr>
											<th>Publisher Phone: </th>
											<td><form:input path="publishers[${status.index}].phone" size="50"/></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty book.publishers}">
									<tr>
										<th>Publisher Name: </th>
										<td><form:input path="publishers[0].name" size="50" id="search"/></td>
									</tr>
									<tr>
										<th>Publisher Address: </th>
										<td><form:input path="publishers[0].address" size="50" id="example"/></td>
									</tr>
									<tr>
										<th>Publisher Phone: </th>
										<td><form:input path="publishers[0].phone" size="50" id="example1"/></td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>	
					<br>
					<div>
						<h3>Category info </h3>
						<table class="tg">
							<tbody>
								<tr>
									<th>Category: </th>
									<td ><form:select path="category.name" id="category" >
									<c:forEach var="c" items="${c}">
									<option value="${c.name}" >${c.name}</option>
									</c:forEach>
									</form:select></td>
									<!--  <td><form:input path="category.name" size="50"/></td>-->
									<td><form:input path="category.name" size="50"/></td>
								</tr>
								<tr>
									<th>Category Description: </th>
									<td><form:textarea path="category.description" rows="5" cols="50"/></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<br>
				<input type="hidden" name="numOfAuthors" value="0" id="numClick">
				<input type="submit" value="Save" class="add-button"/>			
			</form:form>			
		</div>
		<script>
				var numOfAuthors = 0;
				function addRowForAuthor() {
					numOfAuthors++;
					var authors = document.getElementById('idAuthors');
					var size = 50;
					
					var tr1 = document.createElement("tr");
					var th1 = document.createElement("th");
					var td1 = document.createElement("td");
					var input1 = document.createElement("input");					
					
					th1.innerHTML = "Authors Name: ";
					input1.setAttribute("name", "authors[" + numOfAuthors + "].authorsName");
					input1.setAttribute("size", size);
					td1.appendChild(input1);					
					tr1.appendChild(th1);
					tr1.appendChild(td1);
					authors.appendChild(tr1);

					var tr2 = document.createElement("tr");
					var th2 = document.createElement("th");
					var td2 = document.createElement("td");
					var input2 = document.createElement("input");					
					
					th2.innerHTML = "Authors Surname: ";
					input2.setAttribute("name", "authors[" + numOfAuthors + "].authorsSurname");
					input2.setAttribute("size", size);
					td2.appendChild(input2);					
					tr2.appendChild(th2);
					tr2.appendChild(td2);
					authors.appendChild(tr2);

					document.getElementById('numClick').value = numOfAuthors;
					
					return authors;
				}
				/*	function removeField(){
						$(".remove-button").on('click', function() {
							
							$(this).prev().remove();
						   $(this).remove();
						});
					}
				*/
	
			</script>
	</body>
</html>