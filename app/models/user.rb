class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    validates :fullname, :email, presence: true    
    has_many :projects
    has_many :orders, foreign_key: :client_id, class_name: :Order
end
