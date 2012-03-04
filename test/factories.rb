Factory.define :post do |f|
  f.title 'Some post'
  f.content 'Lorem ipsum'
  f.html_content '<p>Lorem ipsum</p>'
  f.sequence(:permalink) { |n| "some-post-#{n}" }
  f.published_at Time.now
end

Factory.define :tag do |f|
  f.sequence(:name) { |n| "tag-#{n}" }
end
