class AddStockQuantityToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :stock_quantity, :integer
  end
end
