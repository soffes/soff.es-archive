#= require jquery
#= require swfobject

soundCloudColor = "f6291d"
apiKey = "TxrZJrlTcohZFYYsx6DIdg"

hasFlash = ->
  for type in navigator.mimeTypes
    return true if type.type == "application/x-shockwave-flash"
  return false

$ ->
  listenButtonClicked = (e) ->
    e.preventDefault()
    el = $(this)
    href = this.getAttribute("href")
    track = href.replace("http://soundcloud.com/samsoffes/", "")
    id = "soundcloud-player-" + track
    
    el.parent().append("<div class=\"soundcloud-player\"><div><div id=\"#{id}\"></div></div></div>");
    div = $("div#"+id)
    
    # Old flash version
    if hasFlash()
      swfobject.embedSWF "http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fsoundcloud.com%2Fsamsoffes%2F"+track+"&show_comments=false&auto_play=true&color="+soundCloudColor, id, "225", "81", "9.0.0", "http://assets.samsoff.es/swf/expressInstall.swf", false, {
        "wmode": "transparent"
        "allowscriptaccess": "always"
      }

    # Reset the close button
    el.html("Close").unbind("click").click(closeButtonClicked)
  
  closeButtonClicked = (e) ->
    e.preventDefault()
    el = $(this)
    $("div", el.parent("li").get(0)).hide().remove()
    el.html("Listen").unbind("click").click(listenButtonClicked)

  $(".tracks li a").click(listenButtonClicked)
