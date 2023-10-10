class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :username, uniqueness: true, presence: true
    validates :fullname, :email, presence: true    
    has_many :projects
    has_many :orders, foreign_key: :client_id, class_name: :Order
end
