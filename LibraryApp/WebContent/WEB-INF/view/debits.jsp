
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
	<p>
		<a href="${pageContext.request.contextPath}/">Back to Home page</a>
	</p>
</div>
