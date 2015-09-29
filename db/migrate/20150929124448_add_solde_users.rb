class AddSoldeUsers < ActiveRecord::Migration
  def change
    add_column :users, :solde, :integer
  end
end
