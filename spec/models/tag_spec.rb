require File.dirname(__FILE__) + '/../spec_helper'

describe Tag do
  it "should be valid" do
    Tag.new.should be_valid
  end
end
