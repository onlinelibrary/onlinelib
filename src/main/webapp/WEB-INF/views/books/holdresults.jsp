<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Search our collection!</h1>
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
							<th>Holded Until</th>
							<th>Release Hold</th>
						</tr>
					</thead>
					<c:forEach var="book" items="${results}">
						<tr>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.title}"></c:out></td>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.author}"></c:out></td>
							<td style="text-wrap: normal; width: 25%;"><fmt:formatDate
									type="date" value="${book.pickupDueDate}" /></td>
							<td style="text-wrap: normal; width: 25%;"><a class="btn btn-small btn-primary"
								href='<c:url value='/releasehold'/>?book=${book.id}'>Release</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${fn:length(results) == 0}">
				<div style="text-align: center; padding-top: 40px;">
					<div class="alert alert-danger">You have no books on hold.</div>
				</div>
			</c:if>
			<div style="padding-top: 2cm; text-align: center;">
				<a class="btn btn-primary" href="<c:url value='search'/>">Click
					here to go back to search page</a>
			</div>
		</div>
	</div>

</div>