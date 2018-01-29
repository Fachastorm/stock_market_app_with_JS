class StocksController < ApplicationController
    before_action :authenticate_user!


    def search
        @user = current_user
        if params[:stock]
            @stock = Stock.find_by_ticker(params[:stock])
            @stock ||= Stock.new_from_lookup(params[:stock])

        end 
        
        if @stock 
            @user = current_user
            @stock.user_ids = current_user.id
            render  :search
        else 
         @stock.nil? 
         render :search, notice: "Stock does not exist." 
    end
end


end 

