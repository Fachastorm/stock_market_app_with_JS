class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string "ticker"
      t.string "name"
      t.decimal "last_price"
      
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
   end
  end
end
