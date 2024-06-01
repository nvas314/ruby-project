class CreateCommunityPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :community_posts do |t|
      t.string :community_id
      t.string :user
      t.timestamp :timestamp
      t.text :message

      t.timestamps
    end
  end
end
