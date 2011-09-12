//= require jquery
//= require swfobject
//= require_self

var soundCloudColor = "f6291d";
var apiKey = "TxrZJrlTcohZFYYsx6DIdg";

$(function() {
	function listenButtonClicked(e) {
		e.preventDefault();
	  var el = $(this),
	    href = this.getAttribute("href");
	    track = href.replace("http://soundcloud.com/samsoffes/", ""),
	    id = "soundcloud-player-"+track;
		
		el.parent().append("<div class=\"soundcloud-player\"><div><div id=\""+id+"\"></div></div></div>");
		var div = $("div#"+id);
		
		// Old flash version
		if (hasFlash()) {		  
  		swfobject.embedSWF("http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fsoundcloud.com%2Fsamsoffes%2F"+track+"&show_comments=false&auto_play=true&color="+soundCloudColor, id, "225", "81", "9.0.0", "/swf/expressInstall.swf", false, {
  			"wmode": "transparent",
  			"allowscriptaccess": "always"
  		});
  	}
  	
  	// HTML5 version. Yays.
  	else {
      var url = "http://api.soundcloud.com/resolve?url="+escape(href)+"&format=json&consumer_key="+apiKey+"&callback=?";
      var audioId = id+"-audio";
      
      $.ajax({
        url: url,
        dataType: 'json',
        success: function(track) {
          var audioUrl = track.download_url+"?consumer_key="+apiKey;
          div.html("\
          <div class=\"waveform\">\
            <div class=\"loading\"></div>\
            <div class=\"position\"></div>\
            <img src=\""+track.waveform_url+"\" alt=\"\" />\
          </div>\
          <audio id=\""+audioId+"\" src=\""+audioUrl+"\" autoplay=\"autoplay\"></audio>");
          
          var loadingIndicator = $('div.waveform div.loading', div[0])[0],
            positionIndicator = $('div.waveform div.position', div[0])[0],
            audioEl = $("audio#"+audioId),
            audio = audioEl[0];
            
          var progress = function() {
            loadingIndicator.style.width = ((audio.buffered.end(0) / audio.duration) * 100)+"%";
          };
          
          var play = function() {
            div.addClass("playing");
          };
          
          var pause = function() {
            div.removeClass("playing");
          };
          
          var timeupdate = function() {
            positionIndicator.style.width = ((audio.currentTime / audio.duration) * 100)+"%";

          };
          
          audioEl
            .bind("timeupdate", timeupdate)
            .bind("progress", progress)
            .bind("play", play)
            .bind("pause ended", play)
            .bind("pause ended", pause);
        }
      });
  	}
		
		// Reset the close button
		el.html("Close").unbind("click").click(closeButtonClicked);
	}
	
	function closeButtonClicked(e) {
		e.preventDefault();
	  var el = $(this);
	  $("div", el.parent("li").get(0)).hide().remove();	
		el.html("Listen").unbind("click").click(listenButtonClicked);
	}

	$(".tracks li a").click(listenButtonClicked);
});
