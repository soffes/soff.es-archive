$(function() {
	$('form#comment-form').submit(function(e) {
		e.preventDefault();
		
		var form_el = this;
		var form = $(form_el);

		// Disabled fields
		var inputs = $('input[type=text], textarea', form_el);
		inputs.attr('disabled', 'disabled');
		inputs.css('color', '#999');

		// Hide the submit button
		$('input[type=submit]').hide();
		
		form.append('<div class="loading">Posting comment...</div>');

		// Post the comment
		$.post(form_el.action, form.serialize(), function(data, textStatus) {
			
			// Posted successfully
			if (data.success == 'true') {

				// Reset and clear the form
				resetForm(form_el, true);
				
				// Add their comment to the list
			}
			
			// There was an error
			else {
			
				// Reset the form, but dont clear it
				resetForm(form_el, false);
			}		
		});
	});
});


function resetForm(form_el, clear) {

	$('div.loading', form_el).remove();

	var inputs = $('input[type=text], textarea', form_el);
	inputs.removeAttr('disabled');
	inputs.css('color', '#000');

	if (clear) {
		inputs.val('');
	}

	$('input[type=submit]', form_el).show();
}