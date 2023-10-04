class ChangeColumnNameToOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :user_id, :client_id
  end
end
