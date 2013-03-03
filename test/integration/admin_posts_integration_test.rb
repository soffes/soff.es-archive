require 'test_helper'

describe 'Post admin integration' do
  before :each do
    page.driver.browser.authorize(ADMIN_USERNAME, ADMIN_PASSWORD)
  end

  it 'shows published in for future posts' do
    future = Factory(:post, title: 'Back to the Future', published_at: 2.days.from_now)
    visit admin_post_path(future)
    page.text.must_include(future.title)
  end

  it 'creates an post as admin' do
    visit admin_posts_path
    click_link 'New Post'
    fill_in 'Title', with: 'Anchorman'
    fill_in 'Permalink', with: 'anchorman'
    fill_in 'Content', with: 'I **love** lamp.'
    fill_in 'Tag names', with: 'awesome lamp'
    click_on 'Submit'

    page.text.must_include('Anchorman')
    Post.last.title.must_equal('Anchorman')
  end

  # it 'should show form when create fails' do
  #   visit admin_posts_path
  #   click_link 'New Post'
  #   fill_in 'Permalink', with: 'anchorman'
  #   fill_in 'Content', with: 'I **love** lamp.'
  #   fill_in 'Tag names', with: 'awesome lamp'
  #   click_on 'Submit'

  #   # Render form
  #   page.text.must_include('Homepageable')
  # end

  it 'edits an post as admin' do
    post = Factory(:post)
    visit admin_post_path(post)

    click_link 'Edit'
    fill_in 'Title', with: 'Anchorman'
    click_on 'Submit'

    page.text.must_include('Anchorman')
  end

  # it 'should show form when edit fails' do
  #   post = Factory(:post)
  #   visit admin_post_path(post)

  #   click_link 'Edit'
  #   fill_in 'Title', with: ''
  #   click_on 'Submit'

  #   # Render form
  #   page.text.must_include('Homepageable')
  # end

  it 'deletes an post as admin' do
    Post.delete_all
    post = Factory(:post)
    visit admin_posts_path

    click_link 'Destroy'
    Post.count.must_equal(0)
  end
end
