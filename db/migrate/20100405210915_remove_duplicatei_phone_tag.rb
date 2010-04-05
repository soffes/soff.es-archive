class RemoveDuplicateiPhoneTag < ActiveRecord::Migration
  def self.up
    tags = Tagging.where(:tag_id => 29).all
    for tag in tags
      tag.tag_id = 10
      tag.save
    end
    
    Tag.destroy(29)
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
