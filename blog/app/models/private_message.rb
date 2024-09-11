class PrivateMessage < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :to_user_id, presence: true
  validates_length_of :text, minimum: 1
end
