class CreateAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :amounts do |t|
      t.string :stock_name 
      t.integer :quantity 
      t.integer :watchlist_id 
    end
  end
end
