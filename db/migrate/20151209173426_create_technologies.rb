class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :name
      t.text :description
      t.string :link
      t.string :doc

      t.timestamps null: false
    end
  end
end
