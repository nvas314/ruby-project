class User < ApplicationRecord
    has_secure_password

    has_many :contacts, dependent: :destroy
    has_many :messengers, dependent: :destroy
    has_many :private_messages, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true
end
