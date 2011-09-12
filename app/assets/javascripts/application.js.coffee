addLoadEvent = (func) ->
  oldonload = window.onload
  if typeof window.onload != "function"
    window.onload = func
  else
    window.onload = ->
      oldonload() if oldonload
      func()

externalLinks = ->
  return if !document.getElementsByTagName || !String.prototype.indexOf
  
  for anchor in document.getElementsByTagName("a")
    rel = anchor.getAttribute("rel")
    external = (rel && rel.indexOf("external") >= 0)
    if anchor.getAttribute("href") && external == true
      anchor.target = "_blank"

# On DOM load, change external links to open in a new window
addLoadEvent(externalLinks)
