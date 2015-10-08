class ChangeTypeToUsers < ActiveRecord::Migration
  def change
    change_column :users, :solde, :float
  end
end
