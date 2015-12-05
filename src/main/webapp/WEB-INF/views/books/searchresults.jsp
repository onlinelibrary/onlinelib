<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
							<th>Availability</th>
							<security:authorize access="hasAnyRole('USER')"><th>Place Hold</th></security:authorize>
						</tr>
					</thead>
					<c:forEach var="book" items="${results}">
						<tr>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.title}"></c:out></td>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.author}"></c:out></td>
							<td style="text-wrap: normal; width: 25%;"><c:if
									test="${book.isAvailable=='Y'}">
									<span style="color: green;">Available</span>
								</c:if> <c:if test="${book.isAvailable!='Y'}">
									<span style="color: red;">Not Available</span>
								</c:if></td>
							<security:authorize access="hasAnyRole('USER')">
							<td style="text-wrap: normal; width: 25%;"><c:if
									test="${book.isAvailable=='Y'}">
									<a href='<c:url value='/placehold'/>?book=${book.id}'>Hold
										this book</a>
								</c:if> <c:if test="${book.isAvailable!='Y'}">
									<span>Currently unavailable</span>
								</c:if></td>
							</security:authorize>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${fn:length(results) == 0}">
				<div style="text-align:center;padding-top:40px;"><div class="alert alert-danger" >No results have been found for the search criteria.</div></div>
			</c:if>
		</div>
	</div>

</div>
