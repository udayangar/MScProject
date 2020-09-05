
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
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">

	<div class="content-frame">
		<div class="page-title">
			<div class="row">
				<h2 class="col-md-9">
					<span class="fa fa-star-o"></span><span style="padding-left: 10px">Favourites</span>
				</h2>
				<div class="col-md-3">
					<div class="col-md-4"></div>
					<div class="col-md-8">
						<h5 class="text-right">
							<a class="panel-settings" style="cursor: pointer; text-decoration: none;" data-toggle="modal"
								data-target="#customizeWidgets" id="customWidget">Customize <span class="fa fa-gear">
							</span></a>
						</h5>
					</div>
					<h2 style="width: 100%;"></h2>
				</div>
			</div>

		</div>
		<!-- START CONTENT FRAME TOP -->
		<!-- END CONTENT FRAME TOP -->

		<!-- START CONTENT FRAME BODY -->
		<div class="content-frame-body">
			<div class="row push-up-12">

			<%-- 	<c:set value="<%=((List<Object[]>) request.getAttribute(\"widgetData\") == null)%>" var="var" />
				<c:if test="${var==true }"> --%>

					<div class="error-container" style="width: 900px!important;">
						<div class="error-code">WELCOME</div>
						<div class="error-text">Let's get started</div>
						<div class="error-subtext">JPA is the dance, Hibernate is the dancer.</div>
					</div>
			<%-- 	</c:if> --%>


				<%
					String color, widgetIcon, code, heading, desc, formAction, id;

					String colStart = "<div class=\"col-md-3\"> <div class=\"tasks\" id=\"drag_drop_col1\"> ";
					String colEnd = "</div></div>";

					@SuppressWarnings("unchecked")
					//List to hold the widget data
					List<Object[]> widgets = null; //(List<Object[]>) request
							//.getAttribute("widgetData");
					String colorArray[] = { "#137251", "#964513", "#967B13", "#8F9613",
							"#965A13", "#D7BE67", "#EADDA6", "#867240", "#396F3D",
							"#2C3F2B", "#080E1E", "#00122A", "#09182F", "#8F9BB1",
							"#5C6983", "#89D7ED", "#6A5A5B", "#C1D3C8", "#00904B",
							"#64BD4F", "#E13987", "#F191BA", "#FEEA65", "#835322",
							"#F97D81", "#F9D08B", "#9881F5", "#82AFF9", "#29264E",
							"#55134E", "#A0596B", "#FEC343", "#EF7351", "#404040",
							"#847C6A", "#A68D5D", "#818286", "#BCBDC1" };

					//data status check
					if (widgets != null) {

						//remainder of the widget count divided by 4 (column number)
						int remainder = widgets.size() % 4;
						//variable to hold the inner looping range
						int jLoopRange;
						int printedExcessCount = 0;

						//if no remainders from division
						if (remainder == 0) {
							// no of rows - full row
							jLoopRange = widgets.size() / 4;
						} else {
							// no of rows - incomplete row
							jLoopRange = (widgets.size() / 4) + 1;
						}

						//Looping four times (fixed column count)
						for (int i = 0; i < 4; i++) {

							//Printing the coulun start HTML elements
							out.print(colStart);

							//widget list index counter
							int widgetsListIndex = i;

							if (remainder != 0 && remainder == printedExcessCount) {
								jLoopRange -= 1;
							}

							//looping to print each cell in a column
							for (int j = 0; j < jLoopRange; j++) {

								if (remainder != 0 && j == jLoopRange - 1) {
									++printedExcessCount;
								}

								//generating a randow number to extract color from the color array
								int idx = new Random().nextInt(colorArray.length);

								//updaring variable values used for cell print string
								id = String.valueOf(widgets.get(widgetsListIndex)[0]); //id 
								widgetIcon = String.valueOf(widgets
										.get(widgetsListIndex)[4]); // icon 
								color = colorArray[idx]; //icon color
								code = String.valueOf(widgets.get(widgetsListIndex)[3]); //widget code
								heading = String
										.valueOf(widgets.get(widgetsListIndex)[2]); //widget heading
								desc = String.valueOf(widgets.get(widgetsListIndex)[6]); // widget description
								formAction = String.valueOf(widgets
										.get(widgetsListIndex)[3]);// form action page

								//String to print HTML elements on the DOM
								String form = "<form action=\"" + formAction
										+ "\" method=\"GET\">";
								String widgetstart = "<div class=\"task-item task-warning\"> <div class=\"task-text\"><div class=\"widget widget-default widget-item-icon\" style=\"cursor: pointer; background: #FFFFFF;\"  onclick=\"$(this).find('form').submit();\">";
								String widgeticon = "<div class=\"widget-item-left\"> <span class=\""
										+ widgetIcon
										+ "\" style=\"color:"
										+ color
										+ "\"></span> </div>";
								String widgetdata = "<div class=\"widget-data\"> <div class=\"widget-int num-count\">"
										+ code
										+ "</div> <div class=\"widget-title\">"
										+ heading
										+ "</div> <div class=\"widget-subtitle\">"
										+ desc + "</div> </div>";
								String widgetcontrol = "<div class=\"widget-controls\"><a href=\"#\" class=\"widget-control-right widget-remove\" id=\""
										+ id
										+ "\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Remove Widget\"><span class=\"fa fa-times\"></span></a></div>";
								String formEnd = " </form>";
								String widgetend = "</div> </div> </div> ";

								//start of cell HTML elements print
								out.print(widgetstart + form + widgeticon + widgetdata
										+ widgetcontrol + formEnd + widgetend);
								//end of cell print

								//widget list index counter increment
								widgetsListIndex += 4;
							}

							//Printing the coulun end HTML elements
							out.print(colEnd);
						}
					} else {
						//no data found

					}
				%>

			</div>
		</div>
		<!-- END CONTENT FRAME BODY -->
	</div>
</div>



<!-- START FAVORIT WIDGET CUSTOMIZATION -->
<div class="modal animated zoomIn" id="customizeWidgets">
	<div class="modal-dialog" style="width: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="defModalHead">Widget Customization</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-5">
							<!-- START SELECTION LEFT BLOCK -->
							<div class="panel panel-warning"
								style="border-right: 1px solid #D7D5D5; border-bottom: 1px solid #D7D5D5; border-left: 1px solid #D7D5D5;">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>Available Widgets</h3>
										<span>un-used forms in favorits category</span>
									</div>
									<ul class="panel-controls" style="margin-top: 2px;">
										<li><a href="#" class="panel-refresh" data-toggle="tooltip" data-placement="top"
											title="Refresh"><span class="fa fa-refresh"></span></a></li>
									</ul>
								</div>
								<div class="panel-body padding-0">
									<div style="height: 245px;">
										<select id="fromSelectBox" multiple="multiple"
											style="width: 100%; height: 100%; border: none">
										</select>
									</div>
								</div>
								<div class="panel-footer" style="text-align: right;">
									<button class="btn btn-default" type="button" onclick="selectAll('fromSelectBox')">
										<i class="fa fa-check-square-o"></i>Select All
									</button>
									<button class="btn btn-default" type="button" onclick="clearAll('fromSelectBox')">
										<i class="fa fa-square-o"></i>Deselect All
									</button>
								</div>
							</div>
							<!-- END OF SELECTION LEFT BLOCK -->
						</div>
						<div class="col-md-2">
							<div style="height: 300px; padding-top: 45px; padding-bottom: 2px;">
								<!-- START CONTROL BUTTON PANEL -->
								<div class="panel-body"
									style="height: 100%; width: 100%; text-align: center; font-size: 20px;">
									<div class="list-group border-bottom">
										<a href="#" class="list-group-item" data-toggle="tooltip" data-placement="top"
											title="Move to Top" id="topmost"><span class="fa fa-angle-double-up"></span> </a> <a
											href="#" class="list-group-item" data-toggle="tooltip" data-placement="top"
											title="Move Up" id="moveup"><span class="fa fa-angle-up"> </span> </a> <a href="#"
											class="list-group-item" data-toggle="tooltip" data-placement="top" title="Move Right"
											id="moveright"><span class="fa fa-angle-right"></span> </a> <a href="#"
											class="list-group-item" data-toggle="tooltip" data-placement="top" title="Move Left"
											id="moveleft"><span class="fa fa-angle-left"></span> </a> <a href="#"
											class="list-group-item" data-toggle="tooltip" data-placement="top" title="Move Down"
											id="movedown"><span class="fa fa-angle-down"></span> </a> <a href="#"
											class="list-group-item" data-toggle="tooltip" data-placement="top" title="Move to Bottom"
											id="bottommost"> <span class="fa fa-angle-double-down"></span>
										</a>
									</div>
								</div>
								<!-- END CONTROL BUTTON PANEL -->
							</div>
						</div>
						<div class="col-md-5">
							<!-- START SELECTION RIGHT BLOCK -->
							<div class="panel panel-success"
								style="border-right: 1px solid #D7D5D5; border-bottom: 1px solid #D7D5D5; border-left: 1px solid #D7D5D5;">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>Selected Widgets</h3>
										<span>current widgets in favorits category</span>
									</div>
									<ul class="panel-controls" style="margin-top: 2px;">
										<li><a href="#" class="panel-refresh" data-toggle="tooltip" data-placement="top"
											title="Refresh"><span class="fa fa-refresh"></span></a></li>
									</ul>
								</div>
								<div class="panel-body padding-0">
									<div style="height: 245px;">
										<select id="toSelectBox" multiple="multiple"
											style="width: 100%; height: 100%; border: none;">
										</select>
									</div>
								</div>
								<div class="panel-footer" style="text-align: right;">
									<button class="btn btn-default" type="button" onclick="selectAll('toSelectBox')">
										<i class="fa fa-check-square-o"></i>Select All
									</button>
									<button class="btn btn-default" type="button" onclick="clearAll('toSelectBox')">
										<i class="fa fa-square-o"></i>Deselect All
									</button>
								</div>
							</div>
							<!-- END OF SELECTION RIGHT BLOCK -->
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<form action="homePage">
					<button class="btn btn-primary" type="button" id="saveList">
						<span class="glyphicon glyphicon-ok"></span>Save
					</button>
					<button type="button" id="closeButton" class="btn btn-primary" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>Close
					</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- END FAVORIT WIDGET CUSTOMIZATION -->


<!-- END PAGE CONTENT WRAPPER -->
<jsp:include page="footer.jsp" />