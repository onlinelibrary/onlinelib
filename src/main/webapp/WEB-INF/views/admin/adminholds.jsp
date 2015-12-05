<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="gutter10">
	<div class="row-fluid" id="">
		<h1 id="skip" style="text-align: center;">Manage Holds</h1>
	</div>
	<div class="row-fluid" style="height: 400px;">
		<%@ include file="../layouts/sidebar.jsp"%>
		<div class="span9 dashboard-rightpanel margin30-b" id="rightpanel">
			<c:if test="${fn:length(results) > 0}">
				<table class="table table-striped">
					<thead>
						<tr class="graydrkbg">
							<th>Title</th>
							<th>Author</th>
							<th>Hold Date</th>
							<th>Release</th>
							<th>Checkout</th>
						</tr>
					</thead>
					<c:forEach var="book" items="${results}">
						<tr>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.title}"></c:out></td>
							<td style="text-wrap: normal; width: 25%;"><c:out
									value="${book.author}"></c:out></td>
							<td style="text-wrap: normal; width: 24%;"><fmt:formatDate
									type="date" value="${book.pickupDueDate}" />&nbsp;&nbsp;<a href="#changeHoldDate" data-id="${book.id}" class="changeDateModal" data-toggle="modal">Change</a></td>
							<td style="text-wrap: normal; width: 12%;"><a
								class="btn btn-small btn-primary"
								href='<c:url value='/releaseholdbyadmin'/>?book=${book.id}'>Release</a>
							</td>
							<td style="text-wrap: normal; width: 12%;"><a
								class="btn btn-small btn-primary"
								href='<c:url value='/checkout'/>?book=${book.id}'>Checkout</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${fn:length(results) == 0}">
				<div style="text-align: center; padding-top: 40px;">
					<div class="alert alert-danger">There are no books on hold
						with the given criteria.</div>
				</div>
			</c:if>
			<div style="padding-top: 2cm; text-align: center;">
				<a class="btn btn-primary" href="<c:url value='manageholds'/>">Click
					here to go back to manage holds page</a>
			</div>
		</div>
	</div>

</div>

    <!-- Modal HTML -->
    <div id="changeHoldDate" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Confirmation</h4>
                </div>
                <div class="modal-body">
                	<div  id="changeHoldDateInputs">
                    <p>Do you want to change the hold date?</p>
                    <i class="icon-calendar"></i>&nbsp;<input type="text" name="selectedholddate" id="datepicker"/>
                    <p class="text-warning"><small>If you don't save, your changes will be lost.</small></p>
                    </div>
                    
                    <div  id="changeHoldDateOutputs">
                    <div id="changeHoldDateSuccess" style="visibility:hidden">Hold date has been successfully updated. Please refresh page to see the results.</div>
                    <div id="changeHoldDateFailure" style="visibility:hidden">Hold date has not been successfully updated. Please try again.</div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <a class="btn btn-primary" href='javascript:void(0)' id='saveHoldDate'>Save changes</a>
                    <input id="holdChangeBookId" type="hidden"></input>
                </div>
           </div>
        </div>
    </div>


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$( "#datepicker" ).datepicker();
	//Pass the user selected date format
	$( "#format" ).change(function() {
	$( "#datepicker" ).datepicker( "option", "dateFormat", $(this).val() );
	});
	});
	
$(".changeDateModal").click( function(e) {

    //get data-id attribute of the clicked element
    var bookId = $(this).data('id');
	//populate the textbox
    $('#holdChangeBookId').val(bookId);
});	

$("#saveHoldDate").click( function(e) {

	//populate the textbox
    var bookId = $('#holdChangeBookId').val();
    var dateSelected = $('#datepicker').val();
	var requestData = "book="+bookId+"&"+"date="+dateSelected;
	$.ajax({
	    url : "/changeholddate",
	    type: "POST",
	    data : requestData,
	    success: function(data, textStatus, jqXHR)
	    {
	        $('#saveHoldDate').css("visibility", "hidden");
	        $('#changeHoldDateInputs').css("visibility", "hidden");
	        $('#changeHoldDateOutputs').css("visibility", "visible");
	        $('#changeHoldDateSuccess').css("visibility", "visible");
	    },
	    error: function (jqXHR, textStatus, errorThrown)
	    {
	        $('#changeHoldDateInputs').css("visibility", "hidden");
	        $('#changeHoldDateOutputs').css("visibility", "visible");
	        $('#changeHoldDateFailure').css("visibility", "visible");
	    }
	});

});	

</script>