require 'spec_helper'

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "MyString",
      :content => "MyText"
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
end
