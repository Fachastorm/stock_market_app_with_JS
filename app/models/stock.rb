class Stock < ApplicationRecord
    has_many :positions
    has_many :users, through: :positions
    
    
    def self.find_by_ticker(ticker_symbol)
        where(ticker: ticker_symbol).first
    end 
    
    def self.new_from_lookup(ticker_symbol)
        stock_results = StockQuote::Stock.quote(ticker_symbol)
        puts "name: #{stock_results.name}"
        return nil unless stock_results.name 
        new_stock = new(ticker: stock_results.symbol, name: stock_results.name)
        new_stock.last_price = new_stock.price
        puts "new stocks: #{new_stock.ticker}"
        new_stock
    end
end