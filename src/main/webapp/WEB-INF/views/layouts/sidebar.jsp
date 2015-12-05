<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<div class="span3" id="sidebar">
	<div class="header" style="text-align: center;">
		<h4>My Stuff</h4>
	</div>
	<ul class="nav nav-tabs nav-stacked">
		<security:authorize access="hasAnyRole('USER')">
		<li><a href="<c:url value="/portal" />"><i class="icon-home"></i>Account
				Home</a></li>
		<li><a href="<c:url value="/search" />"><i
				class="icon-search"></i>Search for books</a></li>
		<li><a href="<c:url value="/showallcheckouts" />"><i class="icon-book"></i>Checkouts</a></li>
		<li><a href="<c:url value="/showallholds" />"><i class="icon-lock"></i>Holds</a></li>
<!-- 		<li><a href="javascript:void(0)"><i class="icon-money"></i>Fines -->
<!-- 				& Payments</a></li> -->
		<li><a href="<c:url value="/contactus" />"><i class="icon-phone"></i>Contact
				Us</a></li>
		</security:authorize>
		
		<security:authorize access="hasAnyRole('ADMIN')">
		<li><a href="<c:url value="/portal" />"><i class="icon-home"></i>Account
				Home</a></li>
		<li><a href="<c:url value="/search" />"><i
				class="icon-search"></i>Search for books</a></li>
		<li><a href="<c:url value="/managecheckouts" />"><i class="icon-book"></i>Manage Checkouts</a></li>
		<li><a href="<c:url value="/manageholds" />"><i class="icon-lock"></i>Manage Holds</a></li>
		<li><a href="<c:url value="/manageusers" />"><i class="icon-user"></i>Manage Users</a></li>
		</security:authorize>
	</ul>

</div>
