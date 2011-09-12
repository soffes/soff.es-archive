require 'spec_helper'

describe Post do
  it 'finds published' do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 2.weeks.from_now)
    Post.published.should include(a)
    Post.published.should_not include(b)
  end

  it 'finds unpublished' do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 2.weeks.from_now)
    Post.unpublished.should include(b)
    Post.unpublished.should_not include(a)
  end

  it 'assigns tags to episodes' do
    post = Factory(:post, :tag_names => 'foo bar')
    post.tags.map(&:name).should eq(%w[foo bar])
    post.tag_names.should eq('foo bar')
  end
  
  it 'requires post date, name, and content' do
    post = Post.new
    post.should have(1).error_on(:published_at)
    post.should have(1).error_on(:title)
    post.should have(1).error_on(:content)
  end
    
  it 'users permalink as to_param' do
    post = Factory(:post, :permalink => 'awesome-cheeseburger')
    post.to_param.should eq('awesome-cheeseburger')
  end
  
  it 'knows if it\'s the last published episode' do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 1.week.ago)
    c = Factory(:post, :published_at => 2.weeks.from_now)
    a.should_not be_last_published
    b.should be_last_published
    c.should_not be_last_published
  end
end
