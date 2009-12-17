require File.dirname(__FILE__) + '/../spec_helper'

describe Comments do
  it "should be valid" do
    Comments.new.should be_valid
  end
end
