require 'spec_helper'

describe 'Post request' do
  it 'lists published' do
    Post.delete_all
    Factory(:post, :title => 'Blast from the Past', :published_at => 2.days.ago)
    Factory(:post, :title => 'Back to the Future', :published_at => 2.days.from_now)
    visit blog_path
    page.should have_content('Blast from the Past')
    page.should_not have_content('Back to the Future')
  end

  it 'provides ATOM feed of posts' do
    Post.delete_all
    Factory(:post, :title => 'Blast from the Past', :published_at => 2.days.ago)
    visit blog_path(:format => :atom)
    page.should have_content('Blast from the Past')
  end

  it 'redirects /posts to /blog' do
    visit '/posts'
    page.current_url.should eq(blog_url)
  end

  it 'is homepageable' do
    Factory(:post, :title => 'Awesome post')
    Factory(:post, :title => 'Silly post', :homepageable => false)
    visit root_path
    page.should have_content('Awesome post')
    page.should_not have_content('Silly post')
  end

  it 'shows a post' do
    post = Factory(:post, :title => 'Awesome post')
    visit post_path(post)
    page.should have_content('Awesome post')
  end

  it 'shows next and previous post' do
    Post.delete_all
    Factory(:post, :title => 'Awesome post', :published_at => 3.weeks.ago)
    post = Factory(:post, :title => 'Something About Trees', :published_at => 2.weeks.ago)
    visit post_path(post)
    page.should have_content('Something About Trees')

    Factory(:post, :title => 'Something About Dogs', :published_at => 1.weeks.ago)
    visit post_path(post)
    page.should have_content('Something About Trees')
    page.should have_content('Something About Dogs')
  end

  it 'uses Pygments for code blocks' do
    post = Factory(:post, :title => 'Awesome post', :content => "Hello\n\n``` ruby\nputs 'foo'\n```")
    visit post_path(post)
    page.should have_selector('div.highlight pre')
  end

  it 'shows all posts' do
    published_post = Factory(:post, :title => 'Awesome post', :published_at => 2.days.ago)
    unpublished_post = Factory(:post, :title => 'Silly post')

    visit post_path(published_post)
    page.should have_content('Awesome post')

    visit post_path(unpublished_post)
    page.should have_content('Silly post')
  end
end
