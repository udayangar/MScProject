<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<%@ page import=" java.util.Random"%>
<%-- <jsp:include page="header.jsp" /> --%>
<%-- <c:set var="system" value="${system}" scope="request" />
<c:set var="module" value="${module}" scope="request" /> --%>

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
							commandName="newForm" id="custOrderForm"
							class="form-horizontal ">
							<div class="row">
								<div class="col-md-1">
									<div class="block"></div>
								</div>
								<div class="col-md-10">
									<!-- START DEFAULT FORM ELEMENTS -->
									<div class="block block-height">

										<div class="form-group">
											<div class="col-md-5">
											<form:input type="hidden"
													path="id" id="field_1" />
											</div>

												<%-- <form:input type="hidden"
													class="validate[required,custom[integer]] form-control"
													name="requiredField" path="id" id="field_1" />
											</div> --%>
											<div class="col-md-5">
												<form:errors path="id"></form:errors>
											</div>
										</div> 
										
										<div class="form-group">
											<form:label class="col-md-2 control-label" path="userCredentialsId">User Id :</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="userCredentialsId"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
												<form:errors path="userCredentialsId"></form:errors>
											</div>
										</div>
										<div class="form-group">
											<form:label class="col-md-2 control-label" path="latitude">Latitude :</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="latitude"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
												<form:errors path="latitude"></form:errors>
											</div>
										</div>
										<div class="form-group">
											<form:label class="col-md-2 control-label" path="latitude">Longitude :</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="longitude"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
												<form:errors path="longitude"></form:errors>
											</div>
										</div>
										
				

                 <div class="form-group">
											<form:label class="col-md-2 control-label" path="prodCat">Product Category :</form:label>
											<%-- <div class="col-md-5">
												<form:input class="form-control" path="prodCat"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div> --%>
											
				 <div class="col-md-5">		
				 
				 <form:select path="prodCat"

                                class="form-control-ddl validate[required]"

                                id="vehicleStatus">

                                <form:option value="0">--Select Category--</form:option>

                                <form:option value="1">Cafeterias</form:option>

                                <form:option value="3">Super Markets</form:option>

                                <form:option value="4">Fashion & Clothing</form:option>

                                <form:option value="11">E-Commerce Business</form:option>

                </form:select>					

                <%-- <form:select path="prodCat"

                                class="form-control-ddl validate[required]" id="prodcat">

                                <form:option value="0">--Select Category--</form:option>

 

                                <c:choose>

                                                <c:when test="${not empty prodCat}">

                                                                <c:forEach items="${prodCat}" var="List">

                                                                                <form:option value="${List.prodCatId}">${List.productName}</form:option>

                                                                </c:forEach>

                                                           </c:when>

                                                        </c:choose>

                                                  </form:select> --%>

                                            </div>
											
											<div class="col-md-5">
												<form:errors path="prodCat"></form:errors>
											</div>
										</div>
		
	


                                        <div class="form-group">
											<form:label class="col-md-2 control-label" path="orderProdut">Produt needs to order:</form:label>
											<div class="col-md-5">
											<form:input class="form-control" path="orderProdut"
													id="field_3" />
												<%-- <form:input class="form-control" path="orderProdut"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" /> --%>
											</div>
											<div class="col-md-5">
												<form:errors path="orderProdut"></form:errors>
											</div>
										</div>
										
										
                                        <div class="form-group">
											<form:label class="col-md-2 control-label" path="quantity">quantity :</form:label>
											<div class="col-md-5">
												<form:input class="form-control" path="quantity"
													id="field_3" style="text-transform:uppercase"
													onblur="this.value=this.value.toUpperCase()" />
											</div>
											<div class="col-md-5">
												<form:errors path="quantity"></form:errors>
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
												<c:when test="${update==true}">
													<button type="submit" name="updt" value="Update"
														class="btn btn-success btn-sm ">
														<span class="glyphicon glyphicon-save"></span>Update
													</button>

												</c:when>
												<c:otherwise>
													<button type="submit" name="isrt"
														class="btn btn-success btn-sm ">
														<span class="glyphicon glyphicon-save"></span>Order
													</button>
												</c:otherwise>
											</c:choose>

											<button type="submit" id="vtpSearch" name="refresh"
												class="btn btn-info btn-sm">
												<span class="glyphicon glyphicon-search "></span>Refresh 
											</button>
											<button type="submit" class="btn btn-warning btn-sm"
												id="restore_defaults" name="reset">
												<span class="glyphicon glyphicon-remove-sign"></span>Clear
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