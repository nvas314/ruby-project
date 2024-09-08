class AddLastMessageToMessengers < ActiveRecord::Migration[7.1]
  def change
    add_column :messengers, :last_message, :datetime
  end
end
