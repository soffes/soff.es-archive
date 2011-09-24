require 'spec_helper'

describe 'Tag request' do
  it 'shows all tags' do
    Factory(:post, :title => 'Blast from the Past', :tags => [Factory.build(:tag, :name => 'oldtimes')])
    Factory(:post, :title => 'Back to the Future')
    visit tags_path
    page.should have_content('oldtimes')
  end

  it 'filters by tag' do
    Factory(:post, :title => 'Blast from the Past', :tags => [Factory.build(:tag, :name => 'oldtimes')])
    Factory(:post, :title => 'Back to the Future')
    visit blog_path
    click_on 'oldtimes'
    page.should have_content('Blast from the Past')
    page.should_not have_content('Back to the Future')
  end
end
