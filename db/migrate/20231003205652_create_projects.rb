class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :built_with
      t.text :description
      t.string :url
      t.float :price
      t.float :fee
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
