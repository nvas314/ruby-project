class TeamPost < ApplicationRecord
  belongs_to :team

  validates :team_id, presence: true
  validates :user_id, presence: true

  
  validates_length_of :post, minimum: 1
end
