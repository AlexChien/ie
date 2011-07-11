//menu
$(document).ready(function(){

	$('li.mainlevel').mousemove(function(){
		$(this).find('ul').slideDown();//you can give it a speed
	});
	$('li.mainlevel').mouseleave(function(){
		$(this).find('ul').slideUp("fast");
	});

	// language switcher
	var curLang = document.location.href.split('html/')[1].split('/')[0];
	var langs = ["cn","en"];
	for(var i=0;i<langs.length;i++){
		var theLang = langs[i];
		if (theLang == curLang){
			$('#lang_'+theLang).addClass('disabled').attr('href','#');
		} else {
			$('#lang_'+theLang).attr('href',document.location.href.replace('/'+curLang+'/','/'+theLang+'/'));
		}
	}
});

//ÀÁÈËÍ¼¿â www.lanrentuku.com