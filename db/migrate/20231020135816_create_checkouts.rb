class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.references :cart, null: false, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
