class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :to_user_id
      t.boolean :blocked
      t.datetime :last_message
      t.datetime :last_saw

      t.timestamps
    end
  end
end
