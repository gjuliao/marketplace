class Order < ApplicationRecord
  belongs_to :project
  belongs_to :client, foreign_key: :client_id, class_name: :User
end
