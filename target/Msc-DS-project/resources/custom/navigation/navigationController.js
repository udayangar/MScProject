$(document).ready(
		function() {

			/*******************************************************************
			 * Author: Lahiru Bandara Created Date: 18-Nov-2014 Purpose:Handling
			 * navigation content in headder.jsp file
			 * 
			 * Version: 001 - LahiruBan
			 * 
			 * 
			 * HTML navigation content has been placed on the header.jsp as this
			 * will be the common navigation for all the .jsp pages
			 * 
			 ******************************************************************/

			/*
			 * this function will handle the navigation menu to show the current
			 * location -- opening and highlighting
			 */
			$(function() {

				// getting the form id from page hidden input field
				var formId = $('#pageLocationInMenu').attr('value');
				// regular expression for string test ending with '#'
				var regexForHash = /^.*_$/;
				// regular expression for string test ending with 'A-Z'
				var regexForForm = /^.*[A-Z]{1}$/;
				// regular expression for strin with ending '.'
				var regexForDot = /^.*-$/;

				// check for menu type
				if (regexForHash.test(formId)) {
					// static menu selected
					$("#" + formId).prev().addClass('active');

				} else if (regexForForm.test(formId)) {
					// dynamic menu with

					// form id without any '-'
					var newFormId = formId.replace(/-/g, "");
					// loop count
					var loopcount = newFormId.length * 2;
					// temp id
					var tempId = "";
					var tempMenu = "";

					// loop for given no of levels
					for (var int = 2; int <= loopcount; int++) {

						// current iteration level
						var menu = formId.substring(0, int);
						// concatenated branch id
						var id = "#" + menu;

						// id existency check
						if ($(id).length !== 0) {
							// if id available

							// if an 'openable' class type
							if (regexForDot.test(menu)) {
								$(id).parent().addClass('active'); // change

							} else {
								// if a form
								$(id).prev().addClass('active');
							}

						} else {

							console.log(" >>>> NO ID");
							console.log(" >>>> TEMP ID :" + tempId);
							console.log(" >>>> TEMP MENU :" + tempMenu);
							// id not available - load it via ajax

							var listObject = $(tempId).next();
							tempMenu = tempMenu.replace(/-/g, ".");

							$.when(appendList(tempMenu, listObject)).done(function() {

								console.log(" >>>> AJAX CALL DONE :" + id);

								// if an 'openable' class type
								if (regexForDot.test(menu)) {

									$('#hiddenItemHighligher').attr('name', 1);
									$('#hiddenItemHighligher').attr('class', menu);
									// $("form " +
									// id).parent().addClass('active'); //
									// change
									console.log(" >>>> OPENABELE CLASS :");

								} else {
									// if a form

									$('#hiddenItemHighligher').attr('name', 0);
									$('#hiddenItemHighligher').attr('class', menu);
									// $("form " +
									// id).prev().addClass('active');
									console.log(" >>>> NOT OPENABLE - FORM :");
								}

								$('#hiddenItemHighligher').click();
								console.log(" >>>> END AJA CALL PROCESS");
							});
						}

						tempId = id;
						tempMenu = menu;
						int++;

						$(id).prev().addClass('active');
						console.log(" >>>> END LOOP ITERATION :" + int);

					}

				}

			});

			$('#hiddenItemHighligher').on('click', function() {

				var openable = $(this).attr('name');
				var cls = $(this).attr('class');

				if (openable == 1) {
					$('#' + cls).parent().addClass('active');
				} else {
					$('#' + cls).prev().addClass('active');
				}
				console.log(" ** test button clicked **");
			});

			/*
			 * this function will bind with on-click event of 'openable'
			 * navigation class and handle the required db calls to gather forms
			 * under selected menu root
			 */

			$('li').on('click', '.openList', function(e) {

				var listObject = $(this).next();
				var id = $(this).attr('id');
				id = id.replace(/-/g, ".");

				appendList(id, listObject);

			});

			/*
			 * Appends the given data list to HTML UL (unordered list) in the
			 * navigation area
			 */
			function appendList(id, listObject) {

				// ajax call to retrieve next navigation level
				$.ajax({
					type : "POST", // action type
					url : 'loadNavigationData', // controller method name
					data : {
						branchId : id
					// branch
					},
					dataType : 'json', // data type
					success : function(data) {

						var regex = /^.*\.$/;
						var printString = "";
						listObject.empty();

						// looping through the data list
						for (var i = 0; i < data.length; i++) {

							var menupath = data[i][6];
							printString = "";

							if (regex.test(menupath)) {

								menupath = menupath.replace(/\./g, "-");

								// print collapsable menu name=\"" + menu path +
								// "\"
								printString += "<li class=\"xn-openable\" > <a class=\"openList\" id=\"" + menupath + "\" href=\"#\"><span class=\""
										+ data[i][3] + "\"></span>" + data[i][1] + "</a><ul>";
								// close the parent2, opened collapsable list
								printString += "</ul></li>";

							} else {

								menupath = menupath.replace(/\./g, "-");
								// print the form
								printString += "<li><a href=\"javascript:{}\" onclick=\"loadPage('" + menupath + "','" + data[i][1]
										+ "');\"><span class=\"" + data[i][3] + "\"></span>" + data[i][1] + "</a></li><form action=\"" + data[i][2]
										+ "\" id=\"" + menupath + "\"></form>";

							}

							listObject.append($(printString));

						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						// if error
						if (jqXHR.status === 401) {
							alert('HTTP Error 401 Unauthorized.');
						} else {
							alert('Uncaught Error.\n' + jqXHR.responseText);
						}

					}
				});
			}

		});
