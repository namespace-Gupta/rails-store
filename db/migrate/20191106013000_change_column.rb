class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:orders, :last_name, true)
  end
end
