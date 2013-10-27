/* Services */

	var citekit_var_services = {};
	var citekit_var_qs_GetPassagePlus = "?request=GetPassagePlus&urn=";
	var citekit_var_qs_GetObjectPlus = "?request=GetObjectPlus&urn=";
	var citekit_var_qs_GetImagePlus = "?request=GetImagePlus&urn=";
	var citekit_var_qs_GetBinaryImage = "?request=GetBinaryImage&urn=";
	var citekit_var_qs_ICT = "ict.html?urn=";


			var scripts = document.getElementsByTagName('script');
			var lastScript = scripts[scripts.length - 1];
			var jsURL = (lastScript.src);
			var rootURL = jsURL.substring(0,jsURL.indexOf('/js'));
			

/* Default Classnames */

	var citekit_var_classNames = {};
	
	citekit_var_classNames["cts"] = "cite-text";
	citekit_var_classNames["citeimg"] = "cite-image";
	citekit_var_classNames["cite"] = "cite-collection";

/* Default Services */

	var citekit_var_default_cts = "";
	var citekit_var_default_img = "";
	var citekit_var_default_coll = "";

/* XSLT Paths */

	var citekit_var_pathTextXslt = rootURL +  "/xslt/citekit-gp.xsl";
	var citekit_var_pathImgXslt = rootURL +  "/xslt/citekit-gip.xsl";
	var citekit_var_pathCollXslt = rootURL +  "/xslt/citekit-coll.xsl";
	var citekit_var_pathGetCapsXslt = "xslt/citekit-gc.xsl";
	var citekit_var_PathGVRXslt = "xslt/citekit-gvr.xsl";

/* Associations of collection-sevices to image-sevice, collection-service to collection-service, and collection-service to cts-service */

	var citekit_coll_img = {};
	var citekit_coll_coll = {};
	var citekit_coll_cts = {};

/* Associations of image-serve to default image-widths */

	var citekit_image_w = {};
	var citekit_default_image_w = 600;
