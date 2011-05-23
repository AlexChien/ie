function initTreeView(){
	if (typeof(current_node) == 'undefined') current_node = location.href.split('/').pop();
	$("#navtree").treeview({animated: "fast", unique: true, persist: "location", collapsed: true});
	// hl current element
	$('#'+current_node).addClass('current');
	// expand the belonging tree
	$('#'+current_node).parent().parent().parent().find('div').click();

	jQuery('#content').accordion({
		autoHeight: false
		//, event: "mouseover"
	});
}