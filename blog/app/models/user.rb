class User < ApplicationRecord
    has_secure_password

    has_many :contacts, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true
end
