class DowncaseTagNames < ActiveRecord::Migration
  def up
    tags = Tag.all
    tags.each do |tag|
      tag.name = tag.name.downcase
      tag.save
      say "#{tag.id} was updated"
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
