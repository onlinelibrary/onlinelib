<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Manage Holds</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel">
			<form name="search" action="<c:url value='retrieveholds'/>"
				method="POST" style="padding-top: 2cm; padding-left: 50px;">
				<table>
					<tr>
						<td>Enter the Username:</td>
						<td><input type='text' name='username' style="width: 400px" /></td>
					</tr>
					<tr>
						<td  style="padding-left:30px;" >OR</td>
					</tr>
					<tr>
						<td>Enter the Date:</td>
						<td><i class="icon-calendar"></i>&nbsp;<input type="text" name="selecteddate" id="datepicker"></td>
					</tr>
					<tr>
						<td colspan='2' style="text-align: center; padding-left: 40px;"><input
							name="manage" value="Manage" class="btn btn-primary"
							type="submit"></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center;">OR</div>
			<form name="retrieve" action="<c:url value='retrieveholds'/>"
				method="POST" style="padding-top: 15px; padding-left: 200px;">
				<table>
					<tr style="padding-top: 20px">
						<td colspan='2' style="text-align: center;"><input
							type='hidden' name='allusers' value="all" style="width: 400px" /><input
							name="search" value="Click here to manage holds by all users"
							class="btn btn-primary" type="submit"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</div>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js">
</script>
<script type="text/javascript">
$(function(){
	$( "#datepicker" ).datepicker();
	//Pass the user selected date format
	$( "#format" ).change(function() {
	$( "#datepicker" ).datepicker( "option", "dateFormat", $(this).val() );
	});
	});
</script>