$(function() {

	var tasks = function() {

		$("#add_new_task")
				.on(
						"click",
						function() {
							var nt = $("#new_task").val();
							if (nt != '') {

								var task = '<div class="task-item task-primary">'
										+ '<div class="task-text">'
										+ nt
										+ '</div>'
										+ '<div class="task-footer">'
										+ '<div class="pull-left"><span class="fa fa-clock-o"></span> now</div>'
										+ '</div>' + '</div>';

								$("#tasks").prepend(task);
							}
						});

		$(
				"#tasks,#drag_drop_col1,#drag_drop_col2, #drag_drop_col3, #drag_drop_col4, #tasks_completed")
				.sortable(
						{
							items : "> .task-item",
							connectWith : "#drag_drop_col1,#drag_drop_col2,#drag_drop_col3, #drag_drop_col4",
							handle : ".task-text",
							receive : function(event, ui) {
								if (this.id == "tasks_completed") {
									ui.item.addClass("task-complete").find(
											".task-footer > .pull-right")
											.remove();
								}
								if (this.id == "tasks_progreess") {
									ui.item
											.find(".task-footer")
											.append(
													'<div class="pull-right"><span class="fa fa-play"></span> 00:00</div>');
								}
								page_content_onresize();
							}
						}).disableSelection();

	}();

});
