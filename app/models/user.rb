class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    validates :fullname, :email, presence: true    
    has_many :projects
end
