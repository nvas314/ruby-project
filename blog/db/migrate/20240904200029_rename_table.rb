class RenameTable < ActiveRecord::Migration[7.1]
  def change
    rename_table :messengers, :mess
  end
end
