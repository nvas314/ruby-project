class ChangeContactsToMessengers < ActiveRecord::Migration[7.1]
  def change
  rename_table :contacts, :mess
  end
end
