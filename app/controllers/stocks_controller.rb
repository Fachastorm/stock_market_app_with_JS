class StocksController < ApplicationController
    before_action :authenticate_user!


    def search
        @user = User.find_by(params[:id])
        if params[:stock]
            @stock = Stock.find_by_ticker(params[:stock])
            @stock ||= Stock.new_from_lookup(params[:stock])

        end 
        
        if @stock 
            @user = User.find_by(params[:id])
            @stock.user_ids = @user.id
            render  :search
        else 
         @stock.nil? 
         render :search, notice: "Stock does not exist." 
    end
end


end 

