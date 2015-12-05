<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<link href="<c:url value="/resources/css/bootstrap-responsive.css" />"
	rel="stylesheet" type="text/css" media="screen,print" />
<link href="<c:url value="/resources/css/bootstrap_BRS.css" />"
	rel="stylesheet" type="text/css" media="screen,print" />

<link
	href="<c:url value="/resources/css/jquery-ui-1.8.16.custom.css" />"
	rel="stylesheet" type="text/css" media="screen,print" />
<link href="<c:url value="/resources/css/jquery.ui.datepicker.css" />"
	rel="stylesheet" type="text/css" media="screen,print" />
<link
	href='//fonts.googleapis.com/css?family=Droid+Serif:400,700|Merriweather|Raleway:400,600'
	rel='stylesheet' type='text/css' media="screen,print" />

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.8.2.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui-1.9.2.custom.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/parsley.min.js" />"></script>

</head>
<body>

	<div class="topbar">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="container-wrap" style="padding-top: 2cm;">
		<div class="container">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
	<div id="bottombar" style="padding-bottom: 12cm;">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>