require 'test_helper'

describe 'Admin integration' do
  it 'reports unauthorized access as a normal user' do
    page.driver.browser.authorize(nil, nil)
    visit new_admin_post_path
    page.text.must_include('Access denied')
  end

  # Not sure how to test this
  # it 'redirects to posts' do
  #   page.driver.browser.authorize(ADMIN_USERNAME, ADMIN_PASSWORD)
  #   visit admin_root_path
  #   response.should be_redirect #redirect_to(admin_posts_path)
  # end
end
