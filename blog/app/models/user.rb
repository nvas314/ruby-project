class User < ApplicationRecord
    has_secure_password


    :omniauthable


    has_many :messengers, dependent: :destroy
    has_many :private_messages, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true
    validates :email, presence: true, uniqueness: true


    validates_length_of :username, minimum: 5
    validates_length_of :password, minimum: 5
    validates_length_of :name, minimum: 5
end
