//= require_self
//
//  application.js
//
//  This would be a lot easier with jQuery, but I'm trying 
//  to keep things quick
//

var hasFlash = function() {
  var flashType = "application/x-shockwave-flash",
    types = navigator.mimeTypes,
    type;
  
  for (var i = 0, l = types.length; i < l; i++) {
    type = types[i];
    if (type.type == flashType) {
      return true;
    }
  }
  return false;
};

var addLoadEvent = function(func) {
  var oldonload = window.onload;
  if (typeof window.onload != "function") {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
};

var externalLinks = function() {
  if (!document.getElementsByTagName || !String.prototype.indexOf) {
    return;
  }
  var anchors = document.getElementsByTagName("a");
  for (var i = 0, l = anchors.length; i < l; i++) {
    var anchor = anchors[i],
      rel = anchor.getAttribute("rel"),
      external = (rel && rel.indexOf("external") >= 0);
    if (anchor.getAttribute("href") && external == true) {
      anchor.target = "_blank";
    }
  }
};

// On DOM load, change external links to open in a new window
addLoadEvent(externalLinks);
