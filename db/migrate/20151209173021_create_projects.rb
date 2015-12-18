class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :github
      t.string :twitter
      t.string :url
      t.string :startdate
      t.string :enddate
      t.string :abstract

      t.timestamps null: false
    end
  end
end
