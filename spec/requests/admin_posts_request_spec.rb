require 'spec_helper'

describe 'Post admin request' do
  it 'reports unauthorized access when attempting to create an posts as a normal user' do
    Factory(:post, :title => 'Blast from the Past', :published_at => 2.days.ago)
    visit new_admin_post_path
    page.should have_content('Access denied')
  end

  it 'creates an post as admin'

  it 'edits an post as admin'
  
  it 'deletes an post as admin'
end
