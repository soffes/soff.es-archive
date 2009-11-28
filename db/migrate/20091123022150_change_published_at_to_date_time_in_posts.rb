class ChangePublishedAtToDateTimeInPosts < ActiveRecord::Migration
  def self.up
    change_column(:posts, :published_at, :datetime)
  end

  def self.down
    change_column(:posts, :published_at, :date)
  end
end
