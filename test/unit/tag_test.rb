require 'test_helper'

describe Tag do
  it 'finds or creates tags with names' do
    Tag.delete_all
    Tag.create!(:name => 'foo')
    tags = Tag.with_names(['foo', 'bar'])
    tags.length.must_equal(2)
    Tag.find(:all).must_equal(tags)
  end
end
