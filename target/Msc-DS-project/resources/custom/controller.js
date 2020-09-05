$(document).ready(
		function() {

			/*
			 * This Document is written to handle the customization of the
			 * widgets.
			 * 
			 * User has the ability to select and manage the widgets which
			 * represent different forms
			 * 
			 * -=- Facilitated Scenarios: -=-
			 * 
			 * #User removes all the available widgets #Removing selected items
			 * from the available list #Adding all the forms to the widget list
			 * (might be controlled) #Adding some of the forms to the list
			 * 
			 * -=- Validations Handled: -=-
			 * 
			 * #When user modifies the list, but try to exit without saving
			 * #When user not selecting forms at all.
			 * 
			 * -=- Designed & Developed By: -=-
			 * 
			 * #Lahiru S. Bandara #12/11/2014 #Fusion-Master-Form-Project
			 */

			/*
			 * HTML content is placed in the home.jsp as this PopUp will be used
			 * the same page
			 */

			/* handling frequently visited forms popup */
			
			// ---------temporary commented -------------
			
			/*
			$(function() {

				$.ajax({
					type : "POST",
					url : 'loadFrequentForms',
					data : {
						title : "called from FUForms"
					},
					dataType : 'json',
					success : function(data) {

						$("#frequentNotificationBody").empty();
						var printString = "";

						// append to div
						for (var i = 0; i < data.length; i++) {

							// printing a notification
							printString = printString
									+ "<a style=\"width:100%;height:70px;\" href=\"#\" class=\"list-group-item\" onclick=\"loadPage('" + i
									+ "frequent'" + ",'" + data[i][1] + "');\">  <div style=\"width:8%;height:100%;float:left;\"><div class=\""
									+ data[i][3]
									+ "\" ></div></div><div style=\"width:92%;height:100%;float:right;\"><span class=\"favorite-list-title\">"
									+ data[i][2] + "</span> <p>" + data[i][1] + "</p></div> </a>";

						}
						// alert(printString);
						$("#noOfForms1").text(data.length);
						$("#noOfForms2").text(data.length + " New");

						// setting the forms into content body
						// $($(printString)).appendTo($("#frequentNotificationBody"));

						$("#frequentNotificationBody").html($(printString));

						// setting the frequently used form
						// content body height
						// --overflow will be scrollable.

					
					},
					error : function(jqXHR, textStatus, errorThrown) {
						if (jqXHR.status === 401) {
							alert('HTTP Error 401 Unauthorized.');
						} else {
							alert('Uncaught Error.\n' + jqXHR.responseText);
						}
					}
				});

			});
			
			*/

			/*
			 * When the widget remove icon is clicked function is called
			 * 
			 */
			$('.widget-remove').on('click', function(e) {

				// this.unbind();
				var id = $(this).attr('id');
				updateSelectedWidgetInfo("", id);

			});

			/*
			 * Saving the modified list
			 */
			$('#saveList').on('click', function(e) {

				// alert("clicked");
				// e.preventDefault();

				var setStatus = [];
				var removeStatus = [];

				$("#toSelectBox option").each(function() {

					if ($(this).attr('name') === 'new') {
						setStatus.push(this.value);
					}
				});

				$("#fromSelectBox option").each(function() {

					if ($(this).attr('name') === 'available') {
						removeStatus.push(this.value);
					}
				});

				console.log("to list new ite size is: " + setStatus.length);
				console.log("from list new ite size is: " + removeStatus.length);

				if (setStatus.length > 0 || removeStatus.length > 0) {

					// var myJSONText =
					// JSON.stringify(changesMade);
					var setIds = setStatus.join(";");
					var removeIds = removeStatus.join(";");

					updateSelectedWidgetInfo(setIds, removeIds);
				} else {

					$('#closeButton').trigger("click");
				}

			});

			/*
			 * This methods loads widget enabled form data from the
			 * database.Filtered from the DB via the maintained identification
			 * flag.
			 * 
			 * used method: AJAX Call to DB
			 * 
			 */
			$('#customWidget').on('click', function() {

				$.ajax({
					type : "POST",
					url : 'loadAllForms',
					data : {
						title : "called from loadAllForms for Widget customization"
					},
					dataType : 'json',
					success : function(data) {
						// alert("successful");
						printItems(data);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						if (jqXHR.status === 401) {
							alert('HTTP Error 401 Unauthorized.');
						} else {
							alert('Uncaught Error.\n' + jqXHR.responseText);
						}
					}
				});

			});

			/*
			 * ` This method prints the passed collection of results into the
			 * respective select lists.
			 * 
			 * @param List
			 */

			function printItems(list) {

				$('#fromSelectBox').empty();
				$('#toSelectBox').empty();

				for (var i = 0; i < list.length; i++) {

					// selected flag check
					if (list[i][4] == null) {
						// Printing Available items

						// appending a new option to the select in
						// 'from' side
						$('#fromSelectBox').append('<option name="new" value=' + list[i][0] + '>' + list[i][1] + '</option>');

					} else if (list[i][4] == "Y") {
						// Printing already selected items.

						// adding an option to the 'to' side
						$('#toSelectBox').append('<option name="available" value=' + list[i][0] + '>' + list[i][1] + '</option>');
					}
				}

			}

			/*
			 * Method to separate the Already available items from the
			 * collection
			 * 
			 * @return List
			 */
			function updateSelectedWidgetInfo(setIds, removeIds) {

				$.ajax({
					type : "POST",
					// contentType:'application/json',
					url : 'saveWidgetFlag',
					data : {
						'setIds' : setIds,
						'removeIds' : removeIds
					},
					dataType : 'json',
					success : function(data) {
						window.location.reload();
						// $('#'+formId).closest('form').submit();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						if (jqXHR.status === 401) {
							alert('HTTP Error 401 Unauthorized.');
						} else {
							alert('Uncaught Error.\n' + jqXHR.responseText);
						}
					}
				});
			}

		});
