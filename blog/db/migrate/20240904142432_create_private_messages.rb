class CreatePrivateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :private_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :to_user_id
      t.text :text

      t.timestamps
    end
  end
end
