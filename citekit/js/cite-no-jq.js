
/* load citekit js */

$(document).ready(function(){
	// Get the root url of this script
	var scripts = document.getElementsByTagName('script');
	var lastScript = scripts[scripts.length - 1];
	var jsURL = ""
	for (x = 0; x < scripts.length; x++){
			if (scripts[x].src.indexOf("citekit") > 0){
					jsURL = scripts[x].src;
			}
	}
	//var jsURL = (lastScript.src);
	var rootURL = jsURL.substring(0,jsURL.indexOf('/js'));
	var url = rootURL + "/js/citekit-variables.js";
	$.getScript(url, function(){
			var scripts = document.getElementsByTagName('script');
			var lastScript = scripts[scripts.length - 1];
			var jsURL = (lastScript.src);
			var rootURL = jsURL.substring(0,jsURL.indexOf('/js'));
			var url = rootURL + "/js/citekit.js";
				$.getScript(url, function(){
					bootstrap();
				});
	});
});
