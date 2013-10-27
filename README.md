citekit
=======

Add CITE/CTS URN citations to HTML files, and resolve them to their objects automatically.

# CITEKit - Simple Citation and Quoting of Primary Sources

CITEKit is a collection of scripts that allow easy end-user display of images, data, and textual passages using the CITE/CTS Architecture.[^citation_cts_docs] 

## Assumptions

These instructions begin from a few assumptions:

- That you know what CITE/CTS is.
- That you know that CITE/CTS objects (data-objects, images, and texts) are uniquely identified by URN-formatted citations.
- That you know that that those URNs _identify_ an object, and that a CITE or CTS Service is necessary to _retrieve_ an object.
- That you are reading this because you are familiar with HTML and are interested in the simplest possible way to embed primary sources in an HTML document.

> N.b. CITEKit loads Javascript and CSS dynamically. Occasionally a web-browser’s caching mechanism will confuse this process. If at any point the CITEKit menu fails to appear, and objects fail to load, re-loading the page will usually correct this.

## Quickstart

TBD

## Notes for Deployment

You can invoke CITEKit for a page in one of two ways. The normal way is with:

	`<script type="text/javascript" src="http://folio.furman.edu/citekit/js/cite-jq.js"> </script>`

But if your page is already using jQuery, you won’t want the “normal” way, since it loads its own copy of jQuery. In that case, use:

	`<script type="text/javascript" src="http://folio.furman.edu/citekit/js/cite-no-jq.js"> </script>`

That will load a version of CITEKit that will use the copy of jQuery that your page has already loaded.

## Specifying Service Addresses

CITEKit needs to know the addresses (URLs) of services that can deliver content based on URN citations. Each CITEKit html page needs to include a section of HTML configuring these services.

The configuration is in the form of an HTML `<ul></ul>` element:

TBD
