class ChanngeTeamIdToTeam2 < ActiveRecord::Migration[7.1]
  def change
    drop_table :team_posts
    drop_table :mess
  end
end
