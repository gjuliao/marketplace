class Order < ApplicationRecord
  belongs_to :project
  belongs_to :client, foreign_key: :client_id, class_name: :User
  validates :fee, :value, presence: true
  before_create :calculate_fee

  def calculate_fee
    self.fee = project.price * 0.15
    self.value = project.price
  end
end
