class CreateUserTeams < ActiveRecord::Migration[7.1]
  def change

    drop_table :mess

    create_table :user_teams do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :user_id
      t.string :status
      t.datetime :last_message
      t.boolean :saw_last

      t.timestamps
    end
  end
end
