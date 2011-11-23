require 'spec_helper'

describe 'Tag request' do
  it 'shows all tags' do
    tag = Factory(:tag)
    Factory(:post, :title => 'Blast from the Past', :tags => [tag])
    Factory(:post, :title => 'Back to the Future')
    visit tags_path
    page.should have_content(tag.name)
  end

  it 'filters by tag' do
    tag = Factory.create(:tag)
    post = Factory.create(:post, :title => 'Blast from the Past', :tags => [tag])
    Factory.create(:post, :title => 'Back to the Future')
    visit post_path(post)
    click_on tag.name
    page.should have_content('Blast from the Past')
    page.should_not have_content('Back to the Future')
  end
end
