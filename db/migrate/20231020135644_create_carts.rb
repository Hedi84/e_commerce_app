class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
