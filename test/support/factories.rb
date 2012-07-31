Factory.define :post do |f|
  f.title 'Some post'
  f.content 'Lorem ipsum'
  f.html_content '<p>Lorem ipsum</p>'
  f.permalink 'some-post-%d'
  f.published_at Time.now
end

Factory.define :tag do |f|
  f.name 'tag-%d'
end
