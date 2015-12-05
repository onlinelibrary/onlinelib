<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Welcome, ${displayname}</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel">

			<div style="text-align: center;padding-top:70px;">Get ready to access a wide variety of collection of books!</div> 
			<br />
			<c:if test="${checkouts == 0}">
					<div class="alert alert-danger" style="text-align: center;">You have no books checked out.</div>
			</c:if>
			<c:if test="${checkouts > 0}">
					<div class="alert alert-info" style="text-align: center;">You have <c:out value="${checkouts}"/> book(s) checked out.</div>
			</c:if>
			<c:if test="${holds == 0}">
					<div class="alert alert-danger" style="text-align: center;">You have no books on hold.</div>
			</c:if>
			<c:if test="${holds > 0}">
					<div class="alert alert-info" style="text-align: center;">You have <c:out value="${holds}"/> book(s) on hold.</div>
			</c:if>
			
		</div>
	</div>

</div>