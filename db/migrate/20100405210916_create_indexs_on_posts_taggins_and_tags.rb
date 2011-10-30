class CreateIndexsOnPostsTagginsAndTags < ActiveRecord::Migration
  def up
    add_index(:posts, :permalink, :name => "posts_permalink_index", :unique => true)
    add_index(:tags, :name, :name => "tags_name_index", :unique => true)
    add_index(:taggings, :post_id, :name => "taggings_post_id_index")
    add_index(:taggings, :tag_id, :name => "taggings_tag_id_index")
  end

  def down
    remove_index(:posts, "posts_permalink_index")
    remove_index(:tags, "tags_name_index")
    remove_index(:taggings, "taggins_post_id_index")
    remove_index(:taggings, "taggings_tag_id_index")
  end
end
