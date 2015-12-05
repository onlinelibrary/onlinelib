<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Manage Users</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel"
			style="padding-top: 70px;">
			<div style="text-align:center;color:green;">
				<c:if test="${status=='success'}"><span class="alert alert-info" >User information has been successfully update for username: ${user.userName}</span></c:if>
				<c:if test="${status!='success'}"><span class="alert alert-danger">User information could not be updated at this time. Please try again.</span></c:if>
			</div>
			<div style="padding-top: 1cm; text-align: center;">
				<a class="btn btn-primary" href="<c:url value='manageusers'/>">Click
					here to go back to manage users page</a>
			</div>
		</div>
	</div>

</div>