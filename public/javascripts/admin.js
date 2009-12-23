$(function() {
  
  function generatePermalink(text) {
    // TODO: Replace all
    // TODO: Downcase
    text = text.replace(/\s+/, '-');
    text = text.replace(/'":\.\/&^\*/, '');
    return text;
  }
  
  $('form.edit_post input#post_title').blur(function() {
    var permalink = $('form.edit_post input#post_permalink');
    if (permalink.val() == '') {
      permalink.val(generatePermalink($(this).val()));
    }
  });
  
});
