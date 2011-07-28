//menu
$(document).ready(function(){

	$('li.mainlevel').mousemove(function(){
		$(this).find('ul').slideDown();//you can give it a speed
	});
	$('li.mainlevel').mouseleave(function(){
		$(this).find('ul').slideUp("fast");
	});

	// language switcher
	var version = 2;
	if (document.location.href.split('html/').length > 1)
		version = 1;
	if (document.location.href.split('lang-').length > 1)
		version = 2;
	
	var curLang = 'cn';
	if (version == 1){
		curLang = document.location.href.split('html/')[1].split('/')[0];
	} else {
		var loc = document.location.href.replace('?','/');
		curLang = loc.split('lang-')[1].split('/')[0];
	}
	var langs = ["cn","en"];
	for(var i=0;i<langs.length;i++){
		var theLang = langs[i];
		if (theLang == curLang){
			$('#lang_'+theLang).addClass('disabled').attr('href','#');
		} else {
			var url = '';
			if (version == 1) {
				url = document.location.href.replace('/'+curLang+'/','/'+theLang+'/');
			} else {
				url = document.location.href.replace('lang-'+curLang,'lang-'+theLang);
			}
			$('#lang_'+theLang).attr('href',url);
		}
	}

	
	// highlight side_nav
	// var slug = xxx; //in page variable
	if (typeof(slug) !== 'undefined'){
		var nav = $('#sn_'+slug);
		if (nav) $(nav).parent().addClass('current');
	}
});