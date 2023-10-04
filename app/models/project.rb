class Project < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: :User

  validates :name, :built_with, :description, :url, :price, :owner_id, presence: true
end
