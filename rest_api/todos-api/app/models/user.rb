class User < ApplicationRecord
    has_secure_password
    
    validates_presence_of :username , :password
end
