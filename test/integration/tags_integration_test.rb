require 'test_helper'

describe 'Tag integration' do
  it 'shows all tags' do
    tag = Factory(:tag)
    Factory(:post, :title => 'Blast from the Past', :tags => [tag])
    Factory(:post, :title => 'Back to the Future')
    visit tags_path
    page.text.must_include(tag.name)
  end

  it 'filters by tag' do
    tag = Factory.create(:tag)
    post = Factory.create(:post, :title => 'Blast from the Past', :tags => [tag])
    Factory.create(:post, :title => 'Back to the Future')
    visit post_path(post)
    click_on tag.name
    page.text.must_include('Blast from the Past')
    page.text.wont_include('Back to the Future')
  end
end
