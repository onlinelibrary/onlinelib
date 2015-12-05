<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Search our collection!</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel">
			<form name="search" action="<c:url value='dosearch'/>" method="POST"
				style="padding-top: 2cm; padding-left: 50px;"  data-parsley-validate>
				<table>
					<tr>
						<td>Enter the book title:</td>
						<td><input type='text' name='title' style="width: 400px" required data-parsley-required-message="Please enter the title"/></td>
					</tr>
					<tr>
						<td colspan='2' style="text-align: center;padding-left:40px;"><input
							name="search" value="Search" class="btn btn-primary"
							type="submit"></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center;">OR</div>
			<form name="search" action="<c:url value='showall'/>" method="POST"
				style="padding-top: 15px; padding-left: 200px;" >
				<table>
					<tr style="padding-top: 20px">
						<td colspan='2' style="text-align: center;"><input
							name="search" value="Click here to view the complete collection"
							class="btn btn-primary" type="submit"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</div>