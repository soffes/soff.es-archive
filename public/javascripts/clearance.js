$(function() {
  var options = {
		'transitionIn': 'none',
		'transitionOut': 'none',
		'titlePosition': 'over',
		'titleFormat': function(title, currentArray, currentIndex, currentOpts) {
		    return '<span id="fancybox-title-over">Image ' +  (currentIndex + 1) + ' / ' + currentArray.length + '</span>';
		}
	}
  $("a[rel=backpack]").fancybox(options);
  $("a[rel=mixwizard]").fancybox(options);
  $("a[rel=bell]").fancybox(options);
  $("a[rel=amp]").fancybox(options);
  $("a[rel=oxygen8]").fancybox(options);
  $("a[rel=crybaby]").fancybox(options);
  $("a[rel=gretch]").fancybox(options);
  $("a[rel=eeepc]").fancybox(options);
});
