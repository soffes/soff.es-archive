$(function() {
	
	// Header search field
	if ($('input#header_search').length > 0 && jQuery.browser.safari == true) {
		var header_search = $('input#header_search').get(0);
		header_search.type = 'search';
		header_search.setAttribute('placeholder', 'Search samsoff.es');
		header_search.setAttribute('autosave', 'com.samsoffes.header_search');
		header_search.setAttribute('results', '5');
	}
	
	// Comment form
	$('form#new_comment').submit(function() {
		var form = $(this);
		$.post(form.attr('action')+'.js', form.serialize(), null, 'script');
		return false;
	});
});
