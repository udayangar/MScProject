<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


</div>
<!-- END PAGE CONTENT -->


</div>
<!-- END PAGE CONTAINER -->

<div class="modal animated zoomIn in" style="z-index: 9999999;" id="lov_customize">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only"></span>
				</button>
				<h4 class="modal-title" id="smallModalHead">Customise Search</h4>
			</div>
			<div class="modal-body">
				<div id="lov_popup_data_feild"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary saveCustomisedData">Save</button>
			</div>
		</div>
	</div>
</div>


<!-- 
<div class="modal animated zoomIn" id="modal_lov">
	<div class="modal-dialog" style="width:750px;">
		<div class="modal-content">
			<div class="modal-header" style="height: 50px;">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-4">
							<input onkeyup="search()" type="text" class="form-control search" />
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<div class="col-md-7">
									<input type="radio" class="check" checked="checked" name="searchType" value="D">
									<lable>Downloadable</label>
								</div>
								<div class="col-md-5">
									<input type="radio" class="check" name="searchType" value="E">
									<lable>Editable</label>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<button class="btn btn-primary pull-right" data-toggle="modal" id="lov_customize_option">
								Options &nbsp; <i class="fa fa-cogs"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div id="lov_content_data" class="lov_content_data_normal"></div>
				<div class="row">
					<div class="col-md-8" style="padding-top: 5px; text-align: center;">
						<input type="checkbox" class="check" name="searchType" value="no-user" id="regardlessOfUser">
						<lable style="padding-bottom: 3px;"> View Contracts regardless of the User</label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div id="paginationDIV" class="col-md-10"></div>
				<div class="col-md-2">
					<button type="button" class="btn btn-primary pull-right" data-dismiss="modal" onclick="clearLov()">Close</button>
				</div>
			</div>
		</div>
	</div>
</div> -->

<!-- MODAL LOV -->
<div class="modal animated zoomIn" id="modal_lov">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="height: 50px;">
				<div class="row">
					<div class="col-md-12">
					<label class="control-label">Search </label>
						<div class="col-md-4">
						
							<input onkeyup="search()" type="text" class="form-control search" id="serch_lov"/>
						</div>
						
					</div>
				</div>
			</div>
			<div class="modal-body">
				<div id="lov_content_data" class="lov_content_data_normal"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					onclick="clearLov()">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END MODALS -->

<!-- LOV POPUP -->
<div class="modal animated zoomIn" id="modal_basic">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="defModalHead">Test Heading<input type="text" class="form-control" id="search_lov"></h4>
			</div>
			<div class="modal-body">Some content in modal example</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END  LOV POPUP -->


<!-- MESSAGE BOX-->
<div class="message-box animated fadeIn" data-sound="alert"
	id="mb-signout">
	<div class="mb-container">
		<div class="mb-middle">
			<div class="mb-title">
				<span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?
			</div>
			<div class="mb-content">
				<p>Are you sure you want to log out?</p>
				<p>Press No if youwant to continue work. Press Yes to logout
					current user.</p>
			</div>
			<div class="mb-footer">
				<div class="pull-right">
					<a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
					<button class="btn btn-default btn-lg mb-control-close">No</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<%-- <script type="text/javascript" src="<c:url value="/resources/js/plugins/jquery/jquery.min.js"/>"></script> --%>
<!-- Added to the header -->
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/jquery/jquery-ui.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap.min.js"/>"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/icheck/icheck.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/scrolltotop/scrolltopcontrol.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/morris/raphael-min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/morris/morris.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/rickshaw/d3.v3.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/rickshaw/rickshaw.min.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap-datepicker.js"/>"></script>
	
<%-- <script type='text/javascript'
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap.datetimepicker/js/bootstrap-datetimepicker.js"/>"></script> --%>
	
	<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap-timepicker.min.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap-colorpicker.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap-file-input.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap-select.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/tagsinput/jquery.tagsinput.min.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/dropzone/dropzone.min.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/fileinput/fileinput.min.js"/>"></script>
<script type='text/javascript'
	src="<c:url value="/resources/js/plugins/filetree/jqueryFileTree.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/owl/owl.carousel.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/moment.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/daterangepicker/daterangepicker.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/validationengine/languages/jquery.validationEngine-en.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/validationengine/jquery.validationEngine.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/jquery-validation/jquery.validate.js"/>"></script>
	
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript"
	src="<c:url value="/resources/js/settings.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/actions.js"/>"></script>


<script type="text/javascript"
	src="<c:url value="/resources/js/draggablePanel.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/validate.js"/>"></script>

<!-- ITEM SELECTOR JS-->

<script type="text/javascript"
	src="<c:url value="/resources/custom/itemSelector/jqueryitemselector.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/custom/controller.js"/>"></script>

<!-- END OF ITEM SELECTOR JS-->

<!-- SCROLLABLE TABLE JS-->

<script type="text/javascript"
	src="<c:url value="/resources/custom/table/fixedheadertable.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/custom/table/TableScrollable.js"/>"></script>

<!-- END OF SCROLLABLE TABLE JS-->

<!-- NAVIGATION JS CONTROLLERS-->
<script type="text/javascript"
	src="<c:url value="/resources/custom/navigation/navigationController.js"/>"></script>
<!-- END OF NAVIGATION JS CONTROLLERS-->

<!-- Notification Plugin -->
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/noty/jquery.noty.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/noty/layouts/topCenter.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/noty/layouts/topLeft.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/noty/layouts/topRight.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/noty/themes/default.js"/>"></script>
<!-- End of Notification Plugin -->

<!-- Bootbox Plugin -->
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/bootbox/bootbox.min.js"/>"></script>
<!-- End of Bootbox Plugin -->

<!-- use for rentacar date time picker -->
<%-- <script type="text/javascript"
	src="<c:url value="/resources/bootstrap-datetimepicker-0.0.11/js/bootstrap-datetimepicker.min.js"/>"></script>
 --%>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->
<script>
	/* Function to set the current loading page's title.
	 * 
	 *Eg:- if you click on form in navigation menu 
	 *it will call this function with required parameters 
	 */

	function loadPage(id, title) {

		//alert("before ajax call : title:- " + title);

		$.ajax({
			type : "POST",
			url : 'setSessionTitle',
			data : {
				title : title,
				id : id
			},
			dataType : 'json',
			success : function(data) {
				//alert("successfull");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				//alert("Navigation items did not load properly");
			}
		});

		document.getElementById(id).submit();
	}

	function replaceImageUrl(id, url) {
		$('#' + id).attr('src', url);
		console.log('image changed, id :' + id + ' url:' + url);
	}

	$(function() {
// initiate the Tooltipster plugin
		$('.tooltip').tooltipster();
		$("#file-simple").fileinput({
			showUpload : false,
			showCaption : false,
			browseClass : "btn btn-danger",
			fileType : "any"
		});
		$("#filetree").fileTree({
			root : '/',
			script : 'assets/filetree/jqueryFileTree.php',
			expandSpeed : 100,
			collapseSpeed : 100,
			multiFolder : false
		}, function(file) {
			alert(file);
		}, function(dir) {
			setTimeout(function() {
				page_content_onresize();
			}, 200);
		});

	//	$('.mask_currency').number(true, 2);
		$('.mask_currency').each(function(index) {
			var val = $(this).val();
			if (val.indexOf(".") == -1)
				$(this).val(val + "00");

			$(this).priceFormat();
		});

		$('.mask_currency_inner').each(function() {
			var val = $(this).text();
			if (val.indexOf(".") == -1)
				$(this).text(val + "00");

			$(this).priceFormat();
		});

		$('#displayFormsubmit').validationEngine();
		$("#new").validationEngine();

		$('form').on("submit", function(event) {

			event.preventDefault();

			$('.mask_currency').each(function(index) {
				if ($(this).val() != 0) {
					$(this).val($(this).val().replace(",", ""));

				}
			});

			$(this).unbind('submit').submit()
		});
	});
</script>
</body>
</html>

