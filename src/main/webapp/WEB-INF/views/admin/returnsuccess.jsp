<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Search our collection!</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel"
			style="padding-top: 70px;">
			<div class="alert alert-info" style="text-align:center;color:green;">
				<span>You have successfully returned the book -
					${title}!</span>
			</div>
			<c:if test="${fine!=null}">
			<div class="alert alert-danger" style="text-align:center;color:green;">Collect ${fine} fine from the user.</div>
			</c:if>	
			<div style="padding-top: 1cm; text-align: center;">
				<a class="btn btn-primary" href="<c:url value='managecheckouts'/>">Click
					here to go back to manage checkouts page</a>
			</div>
		</div>
	</div>

</div>