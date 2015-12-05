<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Manage Checkouts</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel">
			<c:if test="${fn:length(results) > 0}">
				<table class="table table-striped">
					<thead>
						<tr class="graydrkbg">
							<th>Title</th>
							<th>Author</th>
							<th>Due Date</th>
							<th>Returned?</th>
						</tr>
					</thead>
					<c:forEach var="book" items="${results}">
						<tr>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.title}"></c:out></td>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.author}"></c:out></td>
							<td style="text-wrap: normal; width: 20%;"><fmt:formatDate
									type="date" value="${book.returnDate}" /></td>
							<td style="text-wrap: normal; width: 15%;"><a
								class="btn btn-small btn-primary"
								href='<c:url value='/returnbook'/>?book=${book.id}'>Update</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${fn:length(results) == 0}">
				<div style="text-align: center; padding-top: 40px;">
					<div class="alert alert-danger">There are no books checked out
						with the given criteria.</div>
				</div>
			</c:if>
			<div style="padding-top: 2cm; text-align: center;">
				<a class="btn btn-primary" href="<c:url value='managecheckouts'/>">Click
					here to go back to manage checkouts page</a>
			</div>
		</div>
	</div>

</div>