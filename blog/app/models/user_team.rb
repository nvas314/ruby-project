class UserTeam < ApplicationRecord
  belongs_to :team

  #t.index [:user_team, :user_id, :team_id], unique: true
  #validates :country, uniqueness: { scope: [:user_id, :team_id] }
end
