class Portfolio < ApplicationRecord
   belongs_to :user 
   has_many :positions, through: :users
   has_many :stocks, through: :positions 


    def stock_already_owned? 
     stock = Stock.find_by_ticker(ticker)
        return false unless stock 
    
        positions.where(stock_id: stock.id).exists?
    end

end