$(function () {
	
	// Comment form
	$('form#new_comment').submit(function() {
		var form = $(this);
		form.find('input, textarea').removeClass('error');
		form.find('input.submit').attr('disabled', 'disabled');
		form.find('span.loader').addClass('loading');
		$.post(form.attr('action')+'.js', form.serialize(), null, 'script');
		return false;
	});
});
