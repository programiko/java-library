<!DOCTYPE html>
<html>

<body>

<h2>Library - Admin Page</h2>

<hr>

<p>Simulate login form with links below:</p>

<br><br>
<div>
		<p><a href="${pageContext.request.contextPath}/">Back to Start page</a></p>
</div>
<br><br>

<a href="${pageContext.request.contextPath}/admin/administrators">Admin - Administrators</a>

<br><br>

<a href="${pageContext.request.contextPath}/member/members">Admin - Members</a>

<br><br>

<a href="url">Regular user page</a>

<br><br>

<!-- Link >> publisher.jsp -->

<a href="${pageContext.request.contextPath}/publisher/publishers">Publisher page</a>


<br><br>

<a href="${pageContext.request.contextPath}/debit/debits">Admin - Debit</a>

<br><br>

<a href="${pageContext.request.contextPath}/book/books">Admin - Books</a>
<br><br>

<a href="${pageContext.request.contextPath}/author/authors">Admin - Authors</a>

<br><br>
<a href="${pageContext.request.contextPath}/category/categories">Category page</a>


<h1>${admin}</h1>
</body>

</html>