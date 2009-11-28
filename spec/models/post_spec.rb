require 'spec_helper'

describe Post do
  
  it "should find published" do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 2.weeks.from_now)
    Post.published.should include(a)
    Post.published.should_not include(b)
  end

  it "should find unpublished" do
    a = Factory(:post, :published_at => 2.weeks.ago)
    b = Factory(:post, :published_at => 2.weeks.from_now)
    Post.unpublished.should include(b)
    Post.unpublished.should_not include(a)
  end
  
  it "should sort recent posts in descending order" do
    Post.delete_all
    p1 = Factory(:post)
    p2 = Factory(:post)
    Post.recent.should == [p2, p1]
  end
  
  # it "should require publication date and name" do
  #   episode = Episode.new
  #   episode.should have(1).error_on(:published_at)
  #   episode.should have(1).error_on(:name)
  # end
  # 
  # it "should automatically generate permalink when creating episode" do
  #   episode = Factory(:episode, :name => ' Hello_ *World* 2.1. ')
  #   episode.permalink.should == 'hello-world-2-1'
  # end
  
end
