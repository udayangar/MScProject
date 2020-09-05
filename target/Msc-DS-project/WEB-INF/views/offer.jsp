<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<%@ page import=" java.util.Random"%>

<!-- CUSTOM CSS -->

<link rel="stylesheet" type="text/css"

                href="<c:url value="/resources/css/theme-custom.css"/>" />

               

<!-- for rent a car data picker -->              

<link rel="stylesheet" type="text/css"

                href="<c:url value="/resources/css/bootstrap/bootstrap.min.css"/>" />

<%-- <link rel="stylesheet" type="text/css"

                href="<c:url value="/resources/bootstrap-datetimepicker-0.0.11/css/bootstrap-datetimepicker.min.css"/>" />           --%>

 

<!-- END CUSTOM CSS -->

 

<!-- MAIN CSS -->

<link rel="stylesheet" type="text/css" id="theme"

                href="<c:url value="/resources/css/theme-default.css"/>" />

<!-- END OF MAIN CSS -->

<script
	src="src/main/webapp/resources/js/plugins/validationengine/languages/jquery.validationEngine-en.js"
	type="text/javascript" charset="utf-8">
	
</script>

  <script type="text/javascript"
         src="<c:url value="/resources/js/plugins/validationengine/jquery.validationEngine.js"/>"></script>
<!-- ============================================================-->
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/jquery/jquery.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/jquery/jquery-ui.min.js"/>"></script>
	


<!-- ============================================================-->
<!-- CUSTOM CSS -->
<script type="text/javascript"
	src="<c:url value="/resources/custom/labelFont.css"/>"></script>
<!-- END CUSTOM CSS -->


<!-- START BREADCRUMB -->
<ul class="breadcrumb">
	<li><form action="homePage" id="formHome">
			<a href="javascript:{}"
				onclick="document.getElementById('formHome').submit();">Home</a>
		</form></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">

	<div class="content-frame">
		<!-- PAGE TITLE -->
		<div class="page-title">
			<h3>
				<span class="fa fa-arrow-circle-o-left"></span> Request Order
			</h3>
		</div>
		<!-- END PAGE TITLE -->

		<!-- START CONTENT FRAME BODY -->
		<div class="content-frame-body">
			<div class="row push-up-12">
				<div class="panel panel-info">
					<div class="panel-body">


						<form:form action="order" method="POST"
							commandName="newFormOffer" id="custOrderForm"
							class="form-horizontal ">
							<div class="row">
								<div class="col-md-1">
									<div class="block"></div>
								</div>
								<div class="col-md-10">
									<!-- START DEFAULT FORM ELEMENTS -->
									<div class="block block-height">

										<%-- <div class="form-group">
											<div class="col-md-5">
											<form:input type="hidden"
													path="id" id="field_1" />
											</div>

												<form:input type="hidden"
													class="validate[required,custom[integer]] form-control"
													name="requiredField" path="id" id="field_1" />
											</div>
											<div class="col-md-5">
												<form:errors path="id"></form:errors>
											</div>
										</div>  --%>
										
										<div class="form-group">
											<form:label class="col-md-2 control-label" path="orderId">Order Id :</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="orderId"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
												<form:errors path="orderId"></form:errors>
											</div>
										</div>
										<div class="form-group">
											<form:label class="col-md-2 control-label" path="merchantId">Merchant Id :</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="merchantId"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
											${merName }
											
											</div>
											<div class="col-md-5">
												<form:errors path="merchantId"></form:errors>
											</div>
										</div>
										<div class="form-group">
											<form:label class="col-md-2 control-label" path="offerPrice">Offer Price :</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="offerPrice"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
												<form:errors path="offerPrice"></form:errors>
											</div>
										</div>
										
				


                                        <div class="form-group">
											<form:label class="col-md-2 control-label" path="newOfferPrice">Customer Request Price:</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="newOfferPrice"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
												<form:errors path="newOfferPrice"></form:errors>
											</div>
										</div>
										
										
                                        
										
									</div>
									<!-- END DEFAULT FORM ELEMENTS -->
								</div>
								<div class="col-md-1">
									<div class="block"></div>
								</div>
							</div>
							<!-- Update or insert -->
							
							<div class="row">
							<div class="alert alert-success"
							style="display: ${successMsgDisplay};">
							${successMsg}
							</div>
							</div>

							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10">
									<!-- <div class="col-md-2"></div> -->
									<div class="col-md-5">
										<div class="block" style="text-align: center;">
											<c:choose>
												<c:when test="${reord==true}">
													<button type="submit" name="reordsts"
														class="btn btn-success btn-sm ">
														<span class="glyphicon glyphicon-save"></span>Refresh
													</button>

												</c:when>
												<c:otherwise>
													<button type="submit" name="acpt"
														class="btn btn-success btn-sm ">
														<span class="glyphicon glyphicon-save"></span>Accept
													</button>
												</c:otherwise>
											</c:choose>

											<button type="submit" id="vtpSearch" name="newprice"
												class="btn btn-info btn-sm">
												<span class="glyphicon glyphicon-search "></span>Reorder for new Price 
											</button>
											<button type="submit" class="btn btn-warning btn-sm"
												id="restore_defaults" name="ordother">
												<span class="glyphicon glyphicon-remove-sign"></span>Reorder from other
											</button>
										</div>
									</div>
									<div class="col-md-2"></div>
									<div class="col-md-5">${err }</div>
								</div>
								<div class="col-md-1"></div>
							</div>
							<!-- end update or insert -->
						</form:form>
					</div>
<div>

${resultOrder}
						</div>
					<div class="panel-footer" id="overlay">
						<div class="alert alert-danger alert-error"
							style="display: ${ErrorMsgDisplay};">
							<a href="#" class="close" data-dismiss="alert">&times;</a>
							${ErrorMsg}
						</div>
						<%-- <div class="alert alert-success"
							style="display: ${successMsgDisplay};">
							<a href="#" class="close" data-dismiss="alert">&times;</a>
							${successMsg}
						</div> --%>
					</div>









				</div>



				<!-- START BORDERED TABLE -->

				<!-- END BORDERED TABLE SAMPLE -->






			</div>
		</div>
		<!-- END CONTENT FRAME BODY -->
	</div>
</div>



<!-- END PAGE CONTENT WRAPPER -->


<script type="text/javascript" src="<c:url value="/resources/js/plugins/jquery/jquery.min.js"/>"></script>
<script type="text/javascript">
$(window).load(function(){
	  setTimeout(function(){ $('#overlay').fadeOut()}, 4000);
	});





</script>
<jsp:include page="footer.jsp" /> 