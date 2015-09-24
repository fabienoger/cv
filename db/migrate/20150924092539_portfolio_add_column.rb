class PortfolioAddColumn < ActiveRecord::Migration
  def change
    create_table :portfolio
    add_column :portfolio, :title, :string
    add_column :portfolio, :link, :string
    add_column :portfolio, :image, :string
    add_column :portfolio, :content, :string
    add_column :portfolio, :date, :date
  end
end
