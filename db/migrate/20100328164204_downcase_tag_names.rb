class DowncaseTagNames < ActiveRecord::Migration
  def self.up
    tags = Tag.all
    tags.each do |tag|
      tag.name = tag.name.downcase
      tag.save
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
