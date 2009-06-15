$(function () {
	
	// Comment form
	$('form#new_comment').submit(function() {
		var form = $(this);
		form.find('input, textarea').removeClass('error');
		$.post(form.attr('action')+'.js', form.serialize(), null, 'script');
		return false;
	});
});
