/**
 * 
 */

$.myvariables = {
	global_row_count : 0,
	global_col_count : 0,
	global_selected_id : null,
	global_lov_id : null,
};

$(document).ready(function() {
	lovClose();
	popupSave();
	lovSearch();
});

/* Getting the LOV data from the DB */
function loadLovData(lov_id, url, requiredColumns, params) {
	var results = null;
	showDataLoadingMode(true);

	$("#fade").css("opacity", 0.6).fadeIn(300, function() {
		// enabling the lov
		$('#lov').removeClass('lov_disabled').addClass('lov_enabled');
	});

	$.ajax({
		type : "POST",
		url : url,
		data : {
			lov_id : lov_id,
			lov_columns : requiredColumns,
			req_params : params,
		},
		dataType : 'json',
		success : function(data) {
			$.myvariables.global_row_count = data.length;
			// $.myvariables.global_col_count = data[0].length;
			set_lov_data_to_displayarea(data, lov_id);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			showDataLoadingMode(false);
			alert("there was a problem loading data. Please refresh and try again. ");
		}
	});

	return results;
}

function set_lov_data_to_displayarea(var_data, lov_id) {

	// variable holding the append string.
	var appendString;

	if (var_data.length != 0) {
		
		$.myvariables.global_row_count = var_data.length;
		$.myvariables.global_col_count = var_data[0].length;

		// creating a new table.
		appendString = "<div class=\"container_12\">";
		appendString = appendString + "<div class=\"grid_4 height400 table-responsive\"	style=\"height: 250px\">";
		appendString = appendString + "<table class=\"table table-bordered table-hover table-striped\" id=\"table_data_set\">";
		// appendString = "<table id=\"table_data_set\">";

		for (var int = 0; int < var_data.length; int++) {

			// adding a new row to the table.
			appendString = appendString + "<tr id=\"r_" + int + "\" onmouseover=\"$(this).hover();\">";

			for (var int2 = 0; int2 < var_data[int].length; int2++) {

				// adding a new cell to a row.
				appendString = appendString + "<td id=\"r_" + int + "_c_" + int2 + "\">";

				// setting the for the cell
				appendString = appendString + var_data[int][int2];

				// end of the cell.
				appendString = appendString + "</td>";
			}

			// end of current row.
			appendString = appendString + "</tr>";
		}

		// end of the table.
		appendString = appendString + "</table>";
		appendString = appendString + "</div>";
		appendString = appendString + "</div>";
	}

	// setting the new table on dom.
	$('#lov_content_data').append(appendString);

	loadRowClickListners(lov_id);
	// showDataLoadingMode(false);

	$('#modal_lov').modal('show');
	lovSearch();

}

function showDataLoadingMode(var_boolean) {

	// enable the div_notification to show the loading status.
	if (var_boolean) {
		$('#lov_content_data').removeClass('lov_content_data_normal').addClass('lov_content_data_loading');
	} else {
		$('#lov_content_data').removeClass('lov_content_data_loading').addClass('lov_content_data_normal');
	}
}

function loadRowClickListners(lov_id) {

	$('#table_data_set tr').on('dblclick', function() {

		$.myvariables.global_selected_id = $('#' + this.id + ' td:first-child').html();

		// assignining the value to lov field
		$('#' + lov_id).val($.myvariables.global_selected_id);

		$('#modal_lov').modal('hide');
		$('#lov_content_data').empty();
		$('#search_lov').val("");
		$( '#' + lov_id ).focus();
	});

}

$.fn.hover = function lovHoverEffect() {

	$(this).children().css({
		'background-color' : '#808080',
		'color' : 'white',
		'cursor' : 'pointer'
	});
	$(this).on('mouseout', function() {

		$(this).children().css({
			'background-color' : 'white',
			'color' : 'black'
		});
	});

}

function lovSearch() {

	$('#search_lov').keyup(function() {

		var keyword = document.getElementById("search_lov").value;
		var row_no = parseInt($.myvariables.global_row_count);
		var col_no = parseInt($.myvariables.global_col_count);

		for (var n = 0; n < row_no; n++) {

			// variable to hold the string.
			var phrase = "";
			// looping through every column.
			for (var i = 0; i < col_no; i++) {
				// appending value to variable.
				phrase += document.getElementById("r_" + n + "_c_" + i).innerHTML;
			}

			if ((phrase.toUpperCase().indexOf(keyword.toUpperCase()) == -1)) {

				document.getElementById("r_" + n).style.display = 'none';

			} else {

				document.getElementById("r_" + n).style.display = '';

			}
		}
	});

}

function lovClose() {
	$('#lov_close').on('click', function(e) {
		$('#search_lov').val("");
		$("#fade").css("opacity", 0.6).fadeOut(100, function() {
			// disabling the LOV
			$('#lov').removeClass('lov_enabled').addClass('lov_disabled');
			$('#lov_content_data').empty();
		});
		e.preventDefault();
	});
}

function popupSave() {
	$('#popup_save').on('click', function() {
		$('#lov_content_data').empty();
		showDataLoadingMode(true);
		loadLovData($.myvariables.global_lov_id, getSelectedCheckBoxes(), global_param_lst);
		$('#search_lov').val("");
		$('#popupdata').removeClass('lov_popup_selection').addClass('lov_popup_selection_disabled');

		// putting the fade div at the back of lov
		$('#fade').css({
			'z-index' : 4999
		});

		$('#lov_popup_data_feild').empty();
	});
}
