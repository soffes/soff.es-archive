require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Post.new.valid?
  end
end
