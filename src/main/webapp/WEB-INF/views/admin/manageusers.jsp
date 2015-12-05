<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Manage Users</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel">
			<form name="search" action="<c:url value='finduser'/>"
				method="POST" style="padding-top: 2cm; padding-left: 50px;"   data-parsley-validate>
				<table>
					<tr>
						<td>Enter the Username:</td>
						<td><input type='text' name='username' style="width: 400px"  required data-parsley-required-message="Please enter the Username"/></td>
					</tr>
					<tr>
						<td colspan='2' style="text-align: center; padding-left: 40px;"><input
							name="manage" value="Manage" class="btn btn-primary"
							type="submit"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>