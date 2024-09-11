class Team < ApplicationRecord

    has_many :team_posts, dependent: :destroy
    has_many :user_teams, dependent: :destroy

    validates :title, presence: true , uniqueness: true
    validates_length_of :title, minimum: 5
end
