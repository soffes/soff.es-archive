// SWFObject
var swfobject=function(){var _1=[];var _2=[];var _3=null;var _4=null;var _5=false;var _6=false;var _7=false;var ua=function(){var _9=typeof document.getElementById!="undefined"&&typeof document.getElementsByTagName!="undefined"&&typeof document.createElement!="undefined"&&typeof document.createTextNode!="undefined"&&typeof document.appendChild!="undefined"&&typeof document.replaceChild!="undefined"&&typeof document.removeChild!="undefined"&&typeof document.cloneNode!="undefined"&&typeof document.parentNode!="undefined"&&typeof document.nodeType!="undefined"&&typeof document.nodeName!="undefined"&&typeof document.nodeValue!="undefined";var _a=[0,0,0];var d=null;if(typeof navigator.plugins!="undefined"&&typeof navigator.plugins["Shockwave Flash"]=="object"){d=navigator.plugins["Shockwave Flash"].description;if(d){d=d.replace(/^.*\s+(\S+\s+\S+$)/,"$1");_a[0]=parseInt(d.replace(/^(.*)\..*$/,"$1"),10);_a[1]=parseInt(d.replace(/^.*\.(.*)\s.*$/,"$1"),10);_a[2]=/r/.test(d)?parseInt(d.replace(/^.*r(.*)$/,"$1"),10):0;}}else{if(typeof window.ActiveXObject!="undefined"){var a=null;var _d=false;try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");}catch(e){try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");_a=[6,0,21];a.AllowScriptAccess="always";}catch(er){if(_a[0]==6){_d=true;}}if(!_d){try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");}catch(err){}}}if(!_d&&typeof a=="object"){d=a.GetVariable("$version");if(d){d=d.split(" ")[1].split(",");_a=[parseInt(d[0],10),parseInt(d[1],10),parseInt(d[2],10)];}}}}var _e=typeof window.opera!="undefined";var _f=_e&&typeof window.opera.version!="undefined"?parseFloat(window.opera.version()):0;var u=navigator.userAgent.toLowerCase();var p=navigator.platform.toLowerCase();var _12=/webkit/.test(u);var _13=_12?parseFloat(u.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):0;var ie=false;var _15=false;var win=p?/win/.test(p):/win/.test(u);var mac=p?/mac/.test(p):/mac/.test(u);/*@cc_on ie=true;@if(@_jscript_version>=5.6)ie6AndUp=true;@end@if(@_win32)win=true;@elif(@_mac)mac=true;@end@*/return {w3cdom:_9,playerVersion:_a,opera:_e,operaVersion:_f,webkit:_12,webkitVersion:_13,ie:ie,ie6AndUp:_15,win:win,mac:mac};}();var _18=function(){if(!ua.w3cdom){return;}addDomLoadEvent(main);if(ua.ie&&ua.win){try{document.write("<script id=__ie_ondomload defer=true src=//:></script>");var s=document.getElementById("__ie_ondomload");if(s&&typeof s.onreadystatechange!="undefined"&&typeof s.readyState!="undefined"){s.onreadystatechange=function(){if(this.readyState=="complete"){this.parentNode.removeChild(this);callDomLoadFunctions();}};}}catch(e){}}if(ua.webkit&&typeof document.readyState!="undefined"){_3=setInterval(function(){if(/loaded|complete/.test(document.readyState)){callDomLoadFunctions();}},10);}if(typeof document.addEventListener!="undefined"){document.addEventListener("DOMContentLoaded",callDomLoadFunctions,null);}addLoadEvent(callDomLoadFunctions);}();function callDomLoadFunctions(){if(_5){return;}_5=true;if(_3){clearInterval(_3);_3=null;}var dl=_1.length;for(var i=0;i<dl;i++){_1[i]();}}function addDomLoadEvent(fn){_1[_1.length]=fn;}function addLoadEvent(fn){if(typeof window.addEventListener!="undefined"){window.addEventListener("load",fn,false);}else{if(typeof document.addEventListener!="undefined"){document.addEventListener("load",fn,false);}else{if(typeof window.attachEvent!="undefined"){window.attachEvent("onload",fn);}else{if(typeof window.onload=="function"){var _1e=window.onload;window.onload=function(){_1e();fn();};}else{window.onload=fn;}}}}}function main(){var rl=_2.length;for(var i=0;i<rl;i++){var id=_2[i].id;var obj=document.getElementById(id);if(obj){if(hasPlayerVersion(_2[i].swfVersion)){if(ua.ie&&ua.win){if(!_6&&typeof window.attachEvent!="undefined"){_6=true;if(ua.ie6AndUp){if(typeof document.readyState!="undefined"&&document.readyState=="complete"){fixActiveContent();}else{window.attachEvent("onload",fixActiveContent);}}if(hasPlayerVersion([9,0,0])){window.attachEvent("onbeforeunload",fixOutOfMemoryError);}if(hasPlayerVersion([8,0,0])){window.attachEvent("onunload",fixObjectLeaks);}}}else{if(ua.opera){if(!_6&&ua.operaVersion>=9){_6=true;addLoadEvent(fixActiveContent);}}else{if(ua.webkit){if(ua.webkitVersion<312){fixParams(obj);}}}}}else{if(_2[i].expressInstall&&!_7&&hasPlayerVersion([6,0,65])&&(ua.win||ua.mac)){displayExpressInstallDialog(_2[i]);}else{displayAltContent(obj);}}}createCSS("#"+id,"visibility:visible");}}function fixActiveContent(){var o=document.getElementsByTagName("object");if(o){var ol=o.length;for(var i=0;i<ol;i++){if(ua.ie&&ua.win){if(typeof o[i].childNodes!="undefined"&&typeof o[i].outerHTML!="undefined"&&typeof o[i].innerHTML!="undefined"){var c=o[i].childNodes;if(c){var cl=c.length;var _28="";for(var j=0;j<cl;j++){if(c[j].nodeType==1&&c[j].nodeName.toLowerCase()=="param"){_28+=c[j].outerHTML;}}o[i].outerHTML=o[i].outerHTML.split(">")[0]+">"+_28+o[i].innerHTML+"</object>";}}}else{if(typeof o[i].getAttribute!="undefined"&&o[i].getAttribute("type")=="application/x-shockwave-flash"){var cn=o[i].cloneNode(true);o[i].parentNode.replaceChild(cn,o[i]);}}}}}function fixOutOfMemoryError(){__flash_unloadHandler=function(){};__flash_savedUnloadHandler=function(){};}function fixObjectLeaks(){var o=document.getElementsByTagName("object");if(o){var ol=o.length;for(var i=0;i<ol;i++){o[i].style.display="none";for(var x in o[i]){if(typeof o[i][x]=="function"){o[i][x]=function(){};}}}}}function fixParams(obj){var _30=obj.getElementsByTagName("object")[0];if(_30){var e=document.createElement("embed");if(typeof _30.attributes!="undefined"){var a=_30.attributes;if(a){var al=a.length;for(var i=0;i<al;i++){if(typeof e.setAttribute!="undefined"){if(a[i].nodeName.toLowerCase()=="data"){e.setAttribute("src",a[i].nodeValue);}else{e.setAttribute(a[i].nodeName,a[i].nodeValue);}}}}}if(typeof _30.childNodes!="undefined"){var c=_30.childNodes;if(c){var cl=c.length;for(var j=0;j<cl;j++){if(c[j].nodeType==1&&c[j].nodeName.toLowerCase()=="param"&&typeof e.setAttribute!="undefined"&&typeof c[j].getAttribute!="undefined"){e.setAttribute(c[j].getAttribute("name"),c[j].getAttribute("value"));}}}}obj.parentNode.replaceChild(e,obj);}}function displayExpressInstallDialog(_38){_7=true;var obj=document.getElementById(_38.id);if(obj){if(_38.altContentId){var ac=document.getElementById(_38.altContentId);if(ac){_4=ac;}}else{_4=abstractAltContent(obj);}var w=_38.width?_38.width:(typeof obj.getAttribute!="undefined"&&obj.getAttribute("width")?obj.getAttribute("width"):0);if(parseInt(w,10)<310){w="310";}var h=_38.height?_38.height:(typeof obj.getAttribute!="undefined"&&obj.getAttribute("height")?obj.getAttribute("height"):0);if(parseInt(h,10)<137){h="137";}var pt=ua.ie&&ua.win?"ActiveX":"PlugIn";document.title=document.title.slice(0,47)+" - Flash Player Installation";var dt=document.title;var fv="MMredirectURL="+window.location+"&MMplayerType="+pt+"&MMdoctitle="+dt;var el=obj;if(ua.ie&&ua.win&&typeof obj.readyState!="undefined"&&obj.readyState!=4&&typeof window.attachEvent!="undefined"){el=document.createElement("div");obj.parentNode.insertBefore(el,obj);obj.style.display="none";window.attachEvent("onload",function(){obj.parentNode.removeChild(obj);});}createSWF({data:_38.expressInstall,id:"swfobjectxi",width:w,height:h},{flashvars:fv},el);}}function displayAltContent(obj){obj.parentNode.replaceChild(abstractAltContent(obj),obj);}function abstractAltContent(obj){var ac=document.createElement("div");if(ua.win&&ua.ie){if(typeof ac.innerHTML!="undefined"){ac.innerHTML=obj.innerHTML;}}else{var _44=obj.getElementsByTagName("object")[0];if(_44&&typeof _44.childNodes!="undefined"){var c=_44.childNodes;if(c){var cl=c.length;for(var i=0;i<cl;i++){if(!(c[i].nodeType==1&&c[i].nodeName.toLowerCase()=="param")&&!(c[i].nodeType==8)){ac.appendChild(c[i].cloneNode(true));}}}}}return ac;}function createSWF(_48,_49,el){if(ua.ie&&ua.win){var att="";for(var i in _48){if(i=="data"){_49.movie=_48[i];}else{if(i!="classid"){att+=" "+i+"=\""+_48[i]+"\"";}}}var par="";for(var j in _49){par+="<param name=\""+j+"\" value=\""+_49[j]+"\" />";}if(typeof el.outerHTML!="undefined"){el.outerHTML="<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\""+att+">"+par+"</object>";}}else{if(ua.webkit&&ua.webkitVersion<312){var e=document.createElement("embed");if(typeof e.setAttribute!="undefined"){e.setAttribute("type","application/x-shockwave-flash");for(var k in _48){if(k=="data"){e.setAttribute("src",_48[k]);}else{if(k!="classid"){e.setAttribute(k,_48[k]);}}}for(var l in _49){if(l!="movie"){e.setAttribute(l,_49[l]);}}el.parentNode.replaceChild(e,el);}}else{var o=document.createElement("object");if(typeof o.setAttribute!="undefined"){o.setAttribute("type","application/x-shockwave-flash");for(var m in _48){if(m!="classid"){o.setAttribute(m,_48[m]);}}for(var n in _49){if(n!="movie"){createObjParam(o,n,_49[n]);}}el.parentNode.replaceChild(o,el);}}}}function createObjParam(el,_56,_57){var p=document.createElement("param");if(typeof p.setAttribute!="undefined"){p.setAttribute("name",_56);p.setAttribute("value",_57);el.appendChild(p);}}function hasPlayerVersion(rv){return (ua.playerVersion[0]>rv[0]||(ua.playerVersion[0]==rv[0]&&ua.playerVersion[1]>rv[1])||(ua.playerVersion[0]==rv[0]&&ua.playerVersion[1]==rv[1]&&ua.playerVersion[2]>=rv[2]))?true:false;}function createCSS(sel,_5b){if(ua.ie&&ua.mac){return;}var h=document.getElementsByTagName("head")[0];var s=document.createElement("style");if(typeof s.setAttribute!="undefined"){s.setAttribute("type","text/css");s.setAttribute("media","screen");if(!(ua.ie&&ua.win)){s.appendChild(document.createTextNode(sel+" {"+_5b+"}"));}h.appendChild(s);if(ua.ie&&ua.win&&typeof document.styleSheets!="undefined"&&document.styleSheets.length>0){var ls=document.styleSheets[document.styleSheets.length-1];if(typeof ls.addRule=="object"){ls.addRule(sel,_5b);}}}}return {registerObject:function(_5f,_60,_61){if(!ua.w3cdom||!_5f||!_60){return;}var _62={};_62.id=_5f;var v=_60.split(".");_62.swfVersion=[parseInt(v[0],10),parseInt(v[1],10),parseInt(v[2],10)];_62.expressInstall=_61?_61:false;_2[_2.length]=_62;createCSS("#"+_5f,"visibility:hidden");},embedSWF:function(_64,_65,_66,_67,_68,_69,_6a,_6b,_6c){if(!ua.w3cdom||!_64||!_65||!_66||!_67||!_68){return;}if(hasPlayerVersion(_68.split("."))){createCSS("#"+_65,"visibility:hidden");var att=(typeof _6c=="object")?_6c:{};att.data=_64;att.width=_66;att.height=_67;var par=(typeof _6b=="object")?_6b:{};if(typeof _6a=="object"){for(var i in _6a){if(typeof par.flashvars!="undefined"){par.flashvars+="&"+i+"="+_6a[i];}else{par.flashvars=i+"="+_6a[i];}}}addDomLoadEvent(function(){createSWF(att,par,document.getElementById(_65));createCSS("#"+_65,"visibility:visible");});}else{if(_69&&!_7&&hasPlayerVersion([6,0,65])&&(ua.win||ua.mac)){createCSS("#"+_65,"visibility:hidden");addDomLoadEvent(function(){var _70={};_70.id=_70.altContentId=_65;_70.width=_66;_70.height=_67;_70.expressInstall=_69;displayExpressInstallDialog(_70);createCSS("#"+_65,"visibility:visible");});}}},getFlashPlayerVersion:function(){return {major:ua.playerVersion[0],minor:ua.playerVersion[1],release:ua.playerVersion[2]};},hasFlashPlayerVersion:function(_71){return hasPlayerVersion(_71.split("."));},expressInstallCallback:function(){if(_7&&_4){var obj=document.getElementById("swfobjectxi");if(obj){obj.parentNode.replaceChild(_4,obj);_4=null;_7=false;}}}};}();

window.addEvent('domready', function() {
	
	// Listen Button
	function listenButtonClicked(event) {
		event.stop();
		
		// Setup vars
		var a = this;
		var li = a.getParent('li');
		var track = a.href.replace('http://soundcloud.com/samsoffes/', '');
		var id = 'soundcloud-player-'+track;
		
		// Create player element
		var player = new Element('div', {
			'class': 'soundcloud-player',
			'html': '<div><div id="'+id+'"></div></div>'
		});
		
		// Inject player after a
		player.inject(a, 'after');
		
		// Animate in
		var playerSlide = new Fx.Slide(player).hide().slideIn();

		// Add swf player
		var playerUrl = 'http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fsoundcloud.com%2Fsamsoffes%2F'+track+'&show_comments=false&auto_play=true&color=01b0f0';
		swfobject.embedSWF(playerUrl, id, '225', '81', '9.0.0', '/swf/expressInstall.swf', false, {
			'wmode': 'transparent',
			'allowscriptaccess': 'always'
		});	
		
		// Remove current event
		a.removeEvents('click');
		
		// Change text
		a.set('text', 'Close');
		
		// Add close event
		a.addEvent('click', closeButtonClicked);
	}
	
	// Close button
	function closeButtonClicked(event) {
		event.stop();
		
		// Setup vars
		var a = this;
		var li = a.getParent('li');
		var player = li.getElement('div.soundcloud-player');
		
		console.log(player);
		
		// Animate out
		var playerSlide = new Fx.Slide(player).slideOut();
		
		// Remove current event
		a.removeEvents('click');
		
		// Change text
		a.set('text', 'Listen');
		
		// Add close event
		a.addEvent('click', listenButtonClicked);		
	}
	
	// Add events
	$$('.tracks li a').addEvent('click', listenButtonClicked);
});
