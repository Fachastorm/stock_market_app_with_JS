class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.integer :user_id 
      t.string :name 
      t.integer :total_value 
    end
  end
end
