<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<h2 style="text-align: center;">
		<span>Welcome to Library Management System!</span>
	</h2>
	<h4 style="text-align: center;">
	</h4>
	<div style="padding-top: 1cm;">
		<div style="width: 400px; height: 300px; float: left">
			<img style="width: 100%; height: 100%;"
				src="resources/images/library_home.jpg" />
		</div>
		<div style="width: 400px; height: 300px; float: right">
			<div class="nav">
				<sec:authorize access="!isAuthenticated()">
					<a class="btn btn-primary" href="<c:url value='/login'/>">Login Now</a>
					<span> If you are already a member.</span>
				</sec:authorize>
			</div>
			<div class="nav">
				<sec:authorize access="!isAuthenticated()">
					<a class="btn btn-primary" href="<c:url value='/signup'/>">Register&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<span>Signup now, to become a member.</span>
				</sec:authorize>
			</div>
		</div>
	</div>
</div>
