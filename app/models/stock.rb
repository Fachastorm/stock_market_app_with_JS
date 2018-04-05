class Stock < ApplicationRecord
    has_many :positions
    has_many :users, through: :positions
    
    
    def self.find_by_ticker(ticker_symbol)
        where(ticker: ticker_symbol).first
    end 
    


    def self.new_from_lookup(ticker_symbol)
        stock_results = StockQuote::Stock.quote(ticker_symbol)
        new_stock = Stock.new(ticker: stock_results.symbol, name: stock_results.company_name)
        new_stock.last_price = new_stock.price
        new_stock
    end


    def price 
        closing_price = StockQuote::Stock.quote(ticker).open
        return "#{closing_price} (Closing)" if closing_price
        opening_price = StockQuote::Stock.quote(ticker).close
        return "#{opening_price} (Opening)" if opening_price
        "Unavailable"
    end 
    
end