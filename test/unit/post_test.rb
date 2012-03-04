require 'test_helper'

describe Post do
  it 'finds published' do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 2.weeks.from_now)
    Post.published.must_include(a)
    Post.published.wont_include(b)
  end

  it 'finds unpublished' do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 2.weeks.from_now)
    Post.unpublished.must_include(b)
    Post.unpublished.wont_include(a)
  end

  it 'sorts recent posts in descending order' do
    Post.delete_all
    p1 = Factory(:post, :published_at => 2.weeks.ago)
    p2 = Factory(:post, :published_at => 1.weeks.ago)
    Post.recent.must_equal([p2, p1])
  end

  it 'assigns tags to posts' do
    post = Factory(:post, :tag_names => 'foo bar')
    post.tags.map(&:name).must_equal(%w[foo bar])
    post.tag_names.must_equal('foo bar')
  end
  
  it 'requires post date, name, and content' do
    post = Post.create
    post.errors[:published_at].wont_be_nil
    post.errors[:title].wont_be_nil
    post.errors[:content].wont_be_nil
  end
    
  it 'users permalink as to_param' do
    post = Factory(:post, :permalink => 'awesome-cheeseburger')
    post.to_param.must_equal('awesome-cheeseburger')
  end
  
  it 'knows if it\'s the last published post' do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 1.week.ago)
    c = Factory(:post, :published_at => 2.weeks.from_now)
    a.last_published?.must_equal(false)
    a.unpublished?.must_equal(false)
    b.last_published?.must_equal(true)
    c.last_published?.must_equal(false)
  end

  it 'knows the next and previous post' do
    Post.delete_all
    p1 = Factory(:post, :published_at => 2.weeks.ago)
    p2 = Factory(:post, :published_at => 1.weeks.ago)
    p1.previous.must_be_nil
    p1.next.must_equal(p2)
    p2.next.must_be_nil
    p2.previous.must_equal(p1)
  end
end
