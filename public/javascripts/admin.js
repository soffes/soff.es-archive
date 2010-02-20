$(function() {
  
  function generatePermalink(text) {
    text = text.toLowerCase();
    text = text.replace(/\s+/g, '-');
    text = text.replace(/'":\.\/&^\*/g, '');
    return text;
  }
  
  var permalink = $('input#post_permalink');
  
  $('input#post_title').blur(function() {
    if (permalink.val() == '') {
      permalink.val(generatePermalink($(this).val()));
    }
  });
  
});
