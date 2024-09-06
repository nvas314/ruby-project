class CreateTeamPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :team_posts do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :user_id
      t.text :post

      t.timestamps
    end
  end
end
