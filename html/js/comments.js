$(function() {
	$('form#comment-form').submit(function(e) {
		e.preventDefault();
		
		// that = this
		var form_el = this;
		var form = $(form_el);

		// Disabled fields
		var inputs = $('input, textarea', form_el);
		inputs.attr('disabled', 'disabled');
		inputs.css('color', '#999');

		// Show indicator
		$('p:last', form_el).append('<span class="loading">Posting comment...</span>');

		// Setup data to post
		var postData = {
			'name': $('input#comment-name', form_el).val(),
			'email': $('input#comment-email', form_el).val(),
			'website': $('input#comment-website', form_el).val(),
			'content': $('textarea#comment-content', form_el).val(),
		};

		// Post the comment
		$.post(form_el.action, postData, function(data, textStatus) {

			// Eval JSON string
			data = $.evalJSON(data);

			// Posted successfully
			if (data.success == 'true') {

				// Reset and clear the form
				resetForm(form_el, true);
				
				// Add their comment to the list
				$('div.comments ul').append(data.html);
				
				// Scroll to it
				//$('html,body').animate({scrollTop: $('div.comments ul li:last').offset().top - 50}, 300);
			}
			
			// There was an error
			else {

				// Reset the form, but dont clear it
				resetForm(form_el, false);
				
				// Loop through errors
				for (var key in data.errors) {			
						
					// Use the style attr, so we can clear it later
					$('#comment-'+key).attr('style', 'border-color:#ff5b50;border-width:2px;margin:0;');
				}
			}
		});
	});
});


function resetForm(form_el, clear) {

	$('span.loading', form_el).remove();

	var inputs = $('input, textarea', form_el);
	inputs.removeAttr('style');
	inputs.removeAttr('disabled');
	inputs.css('color', '#000');

	if (clear) {
		$('input[type=text], textarea', form_el).val('');
	}
}