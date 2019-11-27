class AddProductToProductVariants < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_variants, :product, foreign_key: true
  end
end
