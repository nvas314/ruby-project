class CreateGroupMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :group_messages do |t|
      t.integer :group_id
      t.string :user_from
      t.text :message

      t.timestamps
    end
  end
end
