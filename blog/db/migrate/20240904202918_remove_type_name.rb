class RemoveTypeName < ActiveRecord::Migration[7.1]
  def change
    rename_column :messengers, :type, :status
  end
end
