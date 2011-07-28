function initTreeView(){
	// if (typeof(current_node) == 'undefined') current_node = location.href.split('/').pop().split('.')[0];
	current_node = typeof(slug) !== 'undefined' ? slug : location.href.split('/').pop().split('.')[0];
	$("#navtree").treeview({animated: "fast", unique: true, persist: "location", collapsed: true});
	// hl current element
	$('#'+current_node).addClass('current');

	jQuery('#content').accordion({
		autoHeight: false
		//, event: "mouseover"
	});
	
	// handle in-page panel navigation
	// $('#navtree a').each(function(){
	// 	
	// });
	// expand the belonging tree
	// setTimeout(function(){$('#'+current_node).parent().parent().parent().find('div').click();},100);
	

}

function querySt(ji) {
	hu = window.location.search.substring(1);
	gy = hu.split("&");
	for (i=0;i<gy.length;i++) {
		ft = gy[i].split("=");
		if (ft[0] == ji) {
			return ft[1];
		}
	}
}