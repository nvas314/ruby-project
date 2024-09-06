class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :title
      t.integer :owner_id
      t.string :status

      t.timestamps
    end
  end
end
