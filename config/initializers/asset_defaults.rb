# In production, use hosted Google files
# otherwise, use local copies
if Rails.env.to_sym == :production
  ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => ["http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"]
  # ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_ui => ["http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"]
else
  ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => ["jquery-1.3.2.min.js"]
  # ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_ui => ["jquery-ui-1.7.2.min.js"]
end
