class ChanngeTeamIdToTeam < ActiveRecord::Migration[7.1]
  def change
    remove_column :team_posts , :team_id
    remove_column :user_teams , :team_id
    add_column :team_posts , :team , :reference
    add_column :user_teams , :team , :reference

  end
end
