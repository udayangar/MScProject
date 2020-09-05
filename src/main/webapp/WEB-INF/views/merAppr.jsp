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
				<span class="fa fa-arrow-circle-o-left"></span> Merchant Approval
			</h3>
		</div>
		<!-- END PAGE TITLE -->

		<!-- START CONTENT FRAME BODY -->
		<div class="content-frame-body">
			<div class="row push-up-12">
				<div class="panel panel-info">
					<div class="panel-body">
                     <c:choose>

	<c:when test="${records.size()==0}">

			<em>No Order for Approval</em>

	</c:when>
	<c:otherwise>
	<div>

<table class="table table-bordered table-hover table-striped">

<thead>

	<tr>

			<th>Order ID </th>
			<th>Customer ID</th>
			<th>Customer Name</th>
			<th>Product Name</th>
			<th>Quantity</th>
			<th>Offer Price</th>
			<th>Customer Offer Price</th>
			<th></th>
			<th></th>

	</tr>

</thead>

<tbody>

	<c:forEach items="${records}" var="record">

			<tr>
		<td>${record.id}</td>
		<td>${record.userCredentialsId}</td>
		<td>${record.firstName}</td>
		<td>${record.ordrProduct}</td>
		<td>${record.quantity}</td>
		<td>${record.merchantOfferprice}</td>
		<td>${record.customerOfferprice}</td>

		<td align="center"><form:form action="merchant" commandName="merAppReject"

						id="reg" style="margin-bottom:0px">

						<input type="submit" class="btn btn-success btn-sm"

						name ="approve"            value="  Approve " class="btn btn-info btn-rounded find"

								/>

						<input type="hidden" class="form-control"

								value="${record.id}" name="id" />
								<input type="hidden" class="form-control"
								value="${record.buyMerchantId}" name="buyMerchantId" />

				</form:form></td>
				<td align="center"><form:form action="merchant" commandName="merAppReject"

						id="reg" style="margin-bottom:0px">

						<input type="submit" class="btn btn-success btn-sm"

						name ="reject"            value="  Reject " class="btn btn-info btn-rounded find"

								/>

						<input type="hidden" class="form-control"

								value="${record.id}" name="id" /> 
								<input type="hidden" class="form-control"

								value="${record.buyMerchantId}" name="buyMerchantId" />

				</form:form></td>
			</tr>
	</c:forEach>

</tbody>

</table>
</div>

	</c:otherwise>

</c:choose>
					</div>
                        <div>


						</div>
					<div class="panel-footer" id="overlay">
						<div class="alert alert-danger alert-error"
							style="display: ${ErrorMsgDisplay};">
							<a href="#" class="close" data-dismiss="alert">&times;</a>
							${ErrorMsg}
						</div>
						<div class="alert alert-success"
							style="display: ${successMsgDisplay};">
							<a href="#" class="close" data-dismiss="alert">&times;</a>
							${successMsg}
						</div> 
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