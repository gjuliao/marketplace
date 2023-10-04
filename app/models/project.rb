class Project < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: :User

  validates :name, :built_with, :description, :url, :price, :owner_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }  # Ensure price is numeric and non-negative
end
