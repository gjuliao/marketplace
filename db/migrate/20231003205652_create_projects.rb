class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :built_with
      t.text :description
      t.string :url
      t.float :price
      t.float :fee
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
