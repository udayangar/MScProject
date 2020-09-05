<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<%@ page import=" java.util.Random"%>

<%-- <c:set var="system" value="${system}" scope="request" />
<c:set var="module" value="${module}" scope="request" /> --%>
<jsp:include page="header.jsp" />

<!-- START BREADCRUMB -->
<ul class="breadcrumb">
	<li><form action="homePage" id="formHome">
			<a href="${pageContext.request.contextPath}">Home</a>
		</form></li>
	<li class="active">ERROR</li>

</ul>
<!-- END BREADCRUMB -->

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">

	<div class="alert alert-danger alert-error">
		<a href="#" class="close" data-dismiss="alert">&times;</a> ${errMsg}
		<h5>${subMsg}</h5>
	</div>

</div>
<!-- END PAGE CONTENT WRAPPER -->

<jsp:include page="footer.jsp" />