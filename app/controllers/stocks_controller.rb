class StocksController < ApplicationController


    def search 
        if params[:stock]
            @stock = Stock.find_by_ticker(params[:stock])
            @stock ||= Stock.new_from_lookup(params[:stock])
        end 
        
        if @stock 
            render  :search
        else 
         @stock.nil? 
         render :search, notice: "Stock does not exist." 
    end
end


end 
end
    
