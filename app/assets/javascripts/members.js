// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function create_load_and_display_data_grid(griddiv, data, columns, options, row_details_div, controller, action ) {
	var grid = new Slick.Grid(griddiv, data, columns, options);
    grid.setSelectionModel(new Slick.RowSelectionModel());
    grid.onSelectedRowsChanged.subscribe(function() {
        var selRows = grid.getSelectedRows();
        for (var i = 0, l = selRows.length; i < l; i++) {
          var gridData = grid.getData();
          var item = gridData[selRows[i]];
          if (item) {
            var rowId = item.id;
            hide_load_and_show_div(row_details_div, "/"+controller+"/"+rowId+"/"+action);
            /*$(row_details_div).hide();
            $(row_details_div).load("/"+controller+"/"+rowId+"/"+action);
            $(row_details_div).show();*/
          }
        }
    });
    $(griddiv).show();
}
