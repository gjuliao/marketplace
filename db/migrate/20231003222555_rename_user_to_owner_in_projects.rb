class RenameUserToOwnerInProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :user_id, :owner_id
  end
end
