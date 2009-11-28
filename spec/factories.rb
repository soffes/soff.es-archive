Factory.define :post do |f|
  f.title         'Foo Bar'
  f.permalink     'foo-bar'
  f.body          'Lorem'
  f.published_at  Time.now
end
