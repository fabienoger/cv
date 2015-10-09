class AddCheckedToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :checked, :integer
  end
end
