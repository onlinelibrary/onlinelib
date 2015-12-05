<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container well">
	<h1 id="banner" style="padding-left:425px;">Login</h1>
	<form name="f" style="padding-left:275px;" action="<c:url value='j_spring_security_check'/>"
		method="POST"  data-parsley-validate>
		<table>
			<tr>
				<td>Username:</td>
				<td><input type='text' name='j_username'  required data-parsley-required-message="Please enter your Username"/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='j_password'  required data-parsley-required-message="Please enter your Password"/></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan='2' style="text-align:center;"><input name="submit"  class="btn btn-primary"  type="submit">&nbsp;<input
					name="reset" class="btn btn-primary" type="reset"></td>
			</tr>
		</table>
	</form>
	<c:if test="${'fail' eq param.auth}">
		<div style="padding-left:260px;color: red"> Username and/or password is incorrect. Please try again.</div>
	</c:if>
</div>