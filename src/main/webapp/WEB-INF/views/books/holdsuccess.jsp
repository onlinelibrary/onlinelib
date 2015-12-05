<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Search our collection!</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel"
			style="padding-top: 70px;">
			<div class="alert alert-info" style="text-align:center;color:green;">
				<span>You have successfully placed a hold on the book -
					${title}!<br/>You need to pick up the book on or before <fmt:formatDate
									type="date" value="${pickupdate}" /></span> 
			</div>
			<div style="padding-top: 1cm; text-align: center;">
				<a class="btn btn-primary" href="<c:url value='search'/>">Click
					here to go back to search page</a>
			</div>
		</div>
	</div>

</div>