class CreatePrivateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :private_messages do |t|
      t.string :user_from
      t.string :user_to
      t.timestamp :timestamp
      t.text :message

      t.timestamps
    end
  end
end
