//
//  application.js
//
//  This would be a lot easier with jQuery, but I'm trying 
//  to keep things quick
//

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

function hasFlash() {
  var flashType = 'application/x-shockwave-flash';
  var flash = false;
  var types = navigator.mimeTypes;
  for (var i in types) {
    var type = types[i];
    if (type.type == flashType) {
      flash = true;
      break;
    }
  }
  return flash;
}

// Replace video embeds with a message if no flash
function showNoFlashMessageForVideos() {
  if (hasFlash()) {
    return;
  }
  
  var disabledMessage = '<p style="text-align:center"><strong>Sorry, but you need Flash to watch this video.</strong></p><p style="text-align:center">I hate that as much as you do.</p>';
  
//  var is_iphone = (navigator.userAgent.toLowerCase().indexOf('iphone') != -1);
  
  var videos = document.getElementsByClassName('video');
  for (var i in videos) {
    var video = videos.item(i);
    
    // Vimeo video
    if (video.className.indexOf('vimeo') != -1) {
      var object = video.getElementsByTagName('object').item(0);
      var embed = object.getElementsByTagName('embed').item(0);
      var regex = new RegExp('[?&]clip_id(?:=([^&]*))?', 'i');
      var match = regex.exec(embed.getAttribute('src'));
      
      if (match != null) {
        var clipId = match[1];
        video.innerHTML = '<video src="http://www.vimeo.com/play_redirect?clip_id=' + clipId + '" controls="controls" width="' + object.getAttribute('width') + '" height="' + object.getAttribute('height') + '"></video>';

        var js = document.createElement('script');
        js.setAttribute('src', 'http://www.vimeo.com/api/oembed.json?url=' + encodeURIComponent('http://vimeo.com/' + clipId));
        document.getElementsByTagName('head').item(0).appendChild(js);
      } else {
        video.innerHTML = disabledMessage;
      }
    }
    
    // All other flash
    else {
      video.innerHTML = disabledMessage;
    }
  }
}

// Pop out of frames (I'm looking at you Denver Airport)
if (top.frames.length != 0) {
  top.location = self.document.location;
}

// Scroll down on iPhone
function hideAddressBar() {
	window.scrollTo(0, 0);
}
addEventListener('load', function() {
	setTimeout(hideAddressBar, 0);
}, false);

// On DOM load, update videos if no flash
addLoadEvent(showNoFlashMessageForVideos);
