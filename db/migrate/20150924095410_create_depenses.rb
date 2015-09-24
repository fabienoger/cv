class CreateDepenses < ActiveRecord::Migration
  def change
    create_table :depenses do |t|
      t.string :title
      t.float :value
      t.date :date
      t.integer :checked

      t.timestamps null: false
    end
  end
end
