// CHANGE FOR APPS HOSTED IN SUBDIRECTORY
FCKRelativePath = '';

// DON'T CHANGE THESE
FCKConfig.LinkBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.ImageBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?uploaded='+FCKConfig.uploaded+'&Type=Image&Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.FlashBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?uploaded='+FCKConfig.uploaded+'&Type=Flash&Connector='+FCKRelativePath+'/fckeditor/command';

FCKConfig.LinkUploadURL = FCKRelativePath+'/fckeditor/upload';
FCKConfig.ImageUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Image&uploaded='+FCKConfig.uploaded;
FCKConfig.FlashUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Flash&uploaded='+FCKConfig.uploaded;
FCKConfig.SpellerPagesServerScript = FCKRelativePath+'/fckeditor/check_spelling';
FCKConfig.AllowQueryStringDebug = false;
FCKConfig.SpellChecker = 'SpellerPages';

// ONLY CHANGE BELOW HERE
FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/silver/';

FCKConfig.ToolbarSets["Simple"] = [
	['Source','-','-','Templates'],
	['Cut','Copy','Paste','PasteWord','-','Print','SpellCheck'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','FontFormat'],
	'/',
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Preview'],
	'/',
	['Image','Table','Rule','Smiley','PageBreak'],
	['FontName','FontSize'],
	['TextColor','BGColor'],
	['-','About']
] ;

FCKConfig.ToolbarSets["Basic"] = [
['Bold','Italic','Underline','StrikeThrough','JustifyLeft','JustifyCenter','JustifyRight','Table','Rule','Smiley','SpecialChar','TextColor','BGColor','Preview']
] ;

FCKConfig.ToolbarSets["Comment"] = [
['Bold','Italic','Underline','StrikeThrough','JustifyLeft','JustifyCenter','JustifyRight','Table','Rule','Smiley','SpecialChar']
] ;