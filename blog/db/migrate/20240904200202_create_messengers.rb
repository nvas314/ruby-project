class CreateMessengers < ActiveRecord::Migration[7.1]
  def change
    create_table :messengers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :to_user_id
      t.string :type
      t.boolean :saw_last

      t.timestamps
    end
  end
end
