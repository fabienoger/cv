class CreateProjectTechnologies < ActiveRecord::Migration
  def change
    create_table :project_technologies do |t|
      t.references :project, index: true, foreign_key: true
      t.integer :technology_id

      t.timestamps null: false
    end
  end
end
