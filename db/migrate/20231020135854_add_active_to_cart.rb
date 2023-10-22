class AddActiveToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :active, :boolean, default: true
  end
end
