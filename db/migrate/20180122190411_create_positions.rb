class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.integer :user_id 
      t.integer :stock_id
    end
  end
end
