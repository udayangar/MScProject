<!--

HEADER.JSP // MASTER PAGE

********************************************** DEVELOPER NOTICE ***************************************************

this .jsp page contains common content for the web application and hence included to all the other pages as the
master page. Page contains dynamically generated scripts and please refer to the developer manual before any
MODIFICATIONS

****************************************** END OF DEVELOPER NOTICE ************************************************


DEVELOPER: SANDUN SANJEEWA / LAHIRU BANDARA
VERSION : ORIGINAL VERSION (0.01V)
INITIALLY DEVELOPED FOR: MASTER FORM MODULE
DATE : 25TH NOVEMBER 2014


-->


<!-- PAGE IMPORTS -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List"%>
<!-- END OF PAGE IMPORTS -->

<!DOCTYPE html>
<head>

<!-- START PLUGINS -->
<script type="text/javascript" src="<c:url value="/resources/js/plugins/jquery/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/plugins/jquery/jquery-ui.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/plugins/bootstrap/bootstrap.min.js"/>"></script>
<!-- END PLUGINS -->

<!-- ************ THEME CSS ************ -->

<!-- CUSTOM CSS -->
<script type="text/javascript" src="<c:url value="/resources/css/theme-custom.css"/>"></script>
<!-- END CUSTOM CSS -->

<!-- MAIN CSS -->
<link rel="stylesheet" type="text/css" id="theme"
	href="<c:url value="/resources/css/theme-default.css"/>" />
<!-- END OF MAIN CSS -->

<!-- ******** END OF THEME CSS ********* -->

<!-- KENDO CSS  -->
<link rel="stylesheet" type="text/css" id="theme"
	href="<c:url value="/resources/kendo-styles/kendo.common.min.css"/>" />
<link rel="stylesheet" type="text/css" id="theme"
	href="<c:url value="/resources/kendo-styles/kendo.rtl.min.css"/>" />
<link rel="stylesheet" type="text/css" id="theme"
	href="<c:url value="/resources/kendo-styles/kendo.default.min.css"/>" />
<link rel="stylesheet" type="text/css" id="theme"
	href="<c:url value="/resources/kendo-styles/kendo.dataviz.min.css"/>" />
<link rel="stylesheet" type="text/css" id="theme"
	href="<c:url value="/resources/kendo-styles/kendo.dataviz.default.min.css"/>" />
<!-- END KENDO CSS  -->

<!-- DYNAMIC PAGE TITLE -->
<title>
	<%
		out.write((String) session.getAttribute("title"));
	%>
</title>
<!-- END OF DYNAMIC PAGE TITLE-->

</head>
<body>

	<!-- START PAGE CONTAINER (END IS IN FOOTER PAGE)-->
	<div class="page-container">

		<!-- START PAGE SIDEBAR -->
		<div class="page-sidebar">

			<!-- START X-NAVIGATION -->
			<ul class="x-navigation">
				<li class="xn-logo"><a href="index.html"></a> <a href="#" class="x-navigation-control">
				</a></li>

				<!-- STATIC MAIN MENU CONTENT -->
				<li class="xn-title">My Links</li>
				<%
					// form id
					String formId = (String) session.getAttribute("formId");

					//printing a hidden field to store page menu id
					String printString = "<input type=\"text\" id=\"pageLocationInMenu\" hidden=\"true\" value=\""
							+ formId + "\" "; //print string

					//hiddent button to highlight current menu path
					//out.write("<button id=\"hiddenItemHighligher\">hidden</button>");

					out.write(printString); //print to DOM
				%>


				<!-- home static menu branch -->
				<li data-toggle="tooltip" data-placement="right" title="Home"><a href="javascript:{}"
					onclick="loadPage('home_','Home')"> <span class="fa fa-home"></span><span class="xn-text">
							Home </span>
				</a></li>
				<form action="homePage" id="home_" method="get"></form>
				<!-- end of static menu branch -->

				<!-- END STATIC MAIN MENU CONTENT -->

				<!-- DYNAMIC MAIN MENU CONTENT -->
				<li class="xn-title">Forms</li>
				<%
					//menu list --upto two levels
					List<Object[]> menu = (List<Object[]>) session
							.getAttribute("menuList");

					//variable to record 'openable' class status
					boolean openableActive = false;

					//loop trough menu list
					for (int i = 0; i < menu.size(); i++) {

						//menu path name
						String menupath = String.valueOf(menu.get(i)[7]).replaceAll(
								"\\.", "-");

						//if menupath is of 'openable' type
						if (menupath.endsWith("-")) {

							//if menu is in level one
							if (menupath.length() == 2) {

								//if in 'openable class'
								if (openableActive) {
									//close the opened ul
									out.print("</ul></li>");
									openableActive = false;
								}
								//print collapsable menu
								out.write("<li class=\"xn-openable\"> <a href=\"#\" id=\""
										+ menupath
										+ "\"><span data-toggle=\"tooltip\""
										+ "data-placement=\"right\" title=\""
										+ String.valueOf(menu.get(i)[2])
										+ "\" class=\""
										+ String.valueOf(menu.get(i)[4])
										+ "\"></span> <span class=\"xn-text\">"
										+ String.valueOf(menu.get(i)[2])
										+ "</span></a><ul>");
								//printing the 'openalbe' class content
								openableActive = true;
								continue;//break loop and continue to next iteration

							} else if (menupath.length() == 4) {
								//if menu is in level 2

								//print collapsable menu
								out.write("<li class=\"xn-openable\"> <a class=\"openList\" id=\""
										+ menupath
										+ "\" href=\"#\"><span class=\""
										+ String.valueOf(menu.get(i)[4])
										+ "\"></span>"
										+ String.valueOf(menu.get(i)[2]) + "</a><ul>");

								//close the parent2, opened collapsable list
								out.print("</ul></li>");
							}

						} else {

							//if in the 'openable' class end it
							if (menupath.length() < 2 && openableActive) {
								out.write("</ul></li>");
							}

							//print the menu form. --direct link to menu item
							out.print("<li class=\"firstLevelList\"><a href=\"javascript:{}\" onclick=\"loadPage('"
									+ menupath
									+ "','"
									+ String.valueOf(menu.get(i)[2])
									+ "');\"><span class=\""
									+ String.valueOf(menu.get(i)[4])
									+ "\"></span>"
									+ String.valueOf(menu.get(i)[2])
									+ "</a></li><form action=\""
									+ String.valueOf(menu.get(i)[3])
									+ "\" id=\""
									+ menupath + "\"></form>");

						}

						// if the current menu is the last
						if (i == menu.size() - 1) {

							//if in 'openable' class, end it
							if (openableActive) {

								//close the parent1, opened collapsable list
								out.print("</ul></li>");
							}
						}

					}
				%>
				<!-- END OF DYNAMIC MAIN MENU CONTENT -->
			</ul>
			<!-- END X-NAVIGATION -->
		</div>
		<!-- END PAGE SIDEBAR -->


		<!-- PAGE CONTENT -->
		<div class="page-content">

			<!-- START X-NAVIGATION VERTICAL -->
			<ul class="x-navigation x-navigation-horizontal x-navigation-panel">

				<!-- TOGGLE NAVIGATION -->
				<li class="xn-icon-button"><a href="#" class="x-navigation-minimize"> <span
						class="fa fa-dedent"> </span>
				</a></li>
				<!-- END TOGGLE NAVIGATION -->

				<!-- LOGGED IN COMPANY/MODULE DISPALY -->
				<li>
					<div class="HeaderSystem">
						<link rel="icon" href="favicon.ico" type="image/x-icon" />
						Logged System :
						<%
							out.write((String) session.getAttribute("system"));
						%>

						<span class="SystemNameSeparator">|</span>Logged Module :
						<%
							out.write((String) session.getAttribute("module"));
						%>
					</div>
				</li>
				<!-- END OF LOGGED IN COMPANY/MODULE DISPALY -->


				<!-- SIGN OUT OPTIONS -->
				<li class="xn-icon-button pull-right last"><a href="#"> <span class="fa fa-power-off"
						data-toggle="tooltip" data-placement="left" title="Logout"> </span>
				</a>
					<ul class="xn-drop-left animated zoomIn">
						<li><a href="#"> <span
								class="fa fa-lock"></span>Lock Screen
						</a></li>
						<li><a href="#" class="mb-control" data-box="#mb-signout"> <span
								class="fa fa-sign-out">
									<form action="lockScreen" id="lock"></form>
							</span>Sign Out
						</a></li>
					</ul></li>
				<!-- END SIGN OUT OPTIONS  -->

				<!-- RECENT FORMS -- LOADED DYNAMICALLY // REFER TO DEVELOPER MANUAL FOR MORE INFO-->
				<li class="xn-icon-button pull-right"><a href="#" data-toggle="tooltip"
					data-placement="left" title="Recently Visited" id="frequentForms"> <span
						class="fa fa-bar-chart-o"></span>
				</a>
					<div class="informer informer-danger" id="noOfForms1"></div>
					<div class="panel panel-primary animated zoomIn xn-drop-left xn-panel-dragging">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="fa fa-bar-chart-o"></span><span class="topiconSpace">Frequent Forms</span>
							</h3>
							<div class="pull-right">
								<span class="label label-danger" id="noOfForms2"></span>
							</div>
						</div>
						<div class="panel-body list-group list-group-contacts scroll" style="height: 200px;">
							<div id="frequentNotificationBody"></div>
						</div>
						<div class="panel-footer text-center">
							<a href="#">Show all messages</a>
						</div>
					</div></li>
				<!-- END RECENT FORMS -->

				<!-- TASKS ACHIEVEMENTS INFO-->
				<%
					//gathering task data from the session 
					@SuppressWarnings("unchecked")
					List<Object[]> datalist = (List<Object[]>) session
							.getAttribute("tasks");

					//if list is not empty
					if (datalist != null) {

						//list size
						int taskCount = datalist.size();

						out.write("<li class=\"xn-icon-button pull-right\">");
						out.write("<a href=\"#\"  data-toggle=\"tooltip\" data-placement=\"left\" title=\"My Tasks\">");
						out.write("<span class=\"fa fa-list-alt\"></span></a>");
						out.write("<div class=\"informer informer-warning\">"
								+ taskCount + "</div>");
						out.write("<div class=\"panel panel-primary animated zoomIn xn-drop-left xn-panel-dragging\">");
						out.write("<div class=\"panel-heading\"><h3 class=\"panel-title\">");
						out.write("<span class=\"fa fa-list-alt\"></span><span class=\"topiconSpace\">Tasks</span></h3>");
						out.write("<div class=\"pull-right\">");
						out.write("<span class=\"label label-warning\">" + taskCount
								+ " active</span></div> </div>");
						out.write("<div class=\"panel-body list-group scroll\" style=\"height: 200px;\">");

						//looping to print datalist content
						for (int i = 0; i < datalist.size(); i++) {
							out.write("<a class=\"list-group-item\" href=\"#\">");
							out.write("<strong>" + datalist.get(i)[0] + "</strong>");
							out.write(" <div class=\"progress progress-small progress-striped active\"> ");
							out.write("<div class=\"" + datalist.get(i)[2] + "\"");
							out.write("role=\"progressbar\" aria-valuenow=\""
									+ datalist.get(i)[3] + "\"");
							out.write("aria-valuemin=\"" + datalist.get(i)[4]
									+ "\" aria-valuemax=\"" + datalist.get(i)[5]
									+ "\" ");
							out.write("style=\"width:" + datalist.get(i)[3]
									+ "%;\"></div>");
							out.write("</div> <small class=\"text-muted\">"
									+ datalist.get(i)[1] + " /");
							out.write("" + datalist.get(i)[3] + "%</small></a>");
						}
						// end of the loop

						out.write("</div> <div class=\"panel-footer text-center\">");
						out.write("<a href=\"#\">Show all tasks</a> </div> </div> </li>");

					}
				%>
				<!-- END TASKS ACHIEVEMENTS INFO-->

				<!-- COMPANY SWITCH -->
				<li class="xn-icon-button pull-right"><a href="#" data-toggle="tooltip"
					data-placement="left" title="Switch Company"> <span class="glyphicon glyphicon-transfer"></span>
				</a>
					<ul class="xn-drop-left xn-drop-white animated zoomIn">

						<%
							//comapany list 
							@SuppressWarnings("unchecked")
							List<Object[]> companyList = (List<Object[]>) session
									.getAttribute("companyList");

							//images location path
							String resourceURL = (String) session.getAttribute("resourceURL");

							//if list is not empty
							if (companyList != null) {
								for (int i = 0; i < companyList.size(); i++) {

									//print company info
									out.write(" <li><a href=\"#\"> <img  class=\"flag\" src=\""
											+ resourceURL + "/comp/"
											+ String.valueOf(companyList.get(i)[0])
											+ ".png\"/>"
											+ String.valueOf(companyList.get(i)[1])
											+ " </a></li>");
								}
							}
						%>

					</ul></li>
				<!-- END COMPANY SWITCH -->

				<!-- USER PROFILE -->
				<li class="pull-right"><a href="#" style="height: 50px;" data-toggle="tooltip"
					data-placement="left" title="My Profile"> <span>
							<div class="profile-mini">
								<div class="profile-mini-item timeline-item-right">
									<div class="profile-mini-item-content">
										<div class="profile-mini-heading">
											<img src="<%=session.getAttribute("userImage")%>" id="profilePic"
												onerror="replaceImageUrl('profilePic','<%=session.getAttribute("userImageFallback")%>')"
												alt="<%=session.getAttribute("userAlt")%>" /> <span class="contacts-title"> <%=session.getAttribute("user")%>
											</span>
										</div>
									</div>
								</div>
							</div>
					</span>
				</a>
					<div class="panel panel-primary animated zoomIn xn-drop-left xn-panel-dragging"
						style="width: 180px;">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="fa fa-eye"></span><span class="topiconSpace">My Profile</span>
							</h3>
						</div>
						<div class="panel-body list-group scroll" style="height: 124px;">
							<a class="list-group-item" href="#"> <strong>Update Settings</strong>
							</a> <a class="list-group-item" href="#" > <strong>My
									Profile</strong>
								<form action="userProfile" id="myProfile"></form>
							</a> <a class="list-group-item" href="#"> <strong> Log Out</strong>
							</a>
						</div>
						<div class="panel-footer text-center">
							<a href="#">Go to Dashboard</a>
						</div></li>
				<!-- END USER PROFILE -->
			</ul>
			<!-- END X-NAVIGATION VERTICAL -->