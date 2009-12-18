//  This would be a lot easier with jQuery, but I'm trying 
//  to keep things quick and small

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
  if (hasFlash() == false) {
    var videos = document.getElementsByClassName('video');
    for (var i in videos) {
      var video = videos[i];
      video.innerHTML = '<strong>Sorry, but you need Flash to watch this video.</strong>';
    }
  }
}

// Pop out of frames (I'm looking at you Denver Airport)
if (top.frames.length != 0) {
  top.location=self.document.location;
}

// On DOM load, update videos if no flash
addLoadEvent(showNoFlashMessageForVideos);
