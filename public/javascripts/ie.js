function initTreeView(){
	if (typeof(current_node) == 'undefined') current_node = location.href.split('/').pop().split('.')[0];
	$("#navtree").treeview({animated: "fast", unique: true, persist: "location", collapsed: true});
	// hl current element
	$('#'+current_node).addClass('current');

	jQuery('#content').accordion({
		autoHeight: false
		//, event: "mouseover"
	});
	
	
	// expand the belonging tree
	// setTimeout(function(){$('#'+current_node).parent().parent().parent().find('div').click();},1000);
}