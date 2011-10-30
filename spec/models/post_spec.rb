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

  it 'sorts recent posts in descending order' do
    Post.delete_all
    p1 = Factory(:post, :published_at => 2.weeks.ago)
    p2 = Factory(:post, :published_at => 1.weeks.ago)
    Post.recent.should eq([p2, p1])
  end

  it 'assigns tags to posts' do
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
  
  it 'knows if it\'s the last published post' do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 1.week.ago)
    c = Factory(:post, :published_at => 2.weeks.from_now)
    a.should_not be_last_published
    a.should_not be_unpublished
    b.should be_last_published
    c.should_not be_last_published
  end

  it 'knows the next and previous post' do
    Post.delete_all
    p1 = Factory(:post, :published_at => 2.weeks.ago)
    p2 = Factory(:post, :published_at => 1.weeks.ago)
    p1.previous.should be_nil
    p1.next.should eq(p2)
    p2.next.should be_nil
    p2.previous.should eq(p1)
  end
end
