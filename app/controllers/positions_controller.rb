class PositionsController < ApplicationController
    
    def index 
        @positions = Postion.all 
    end

    def show 
    end 

    def new 
        @position = Position.new 
    end 

    def edit 
    end 

    def create 
        if params(:stock_id).present? 
            @position = Position.new(position_params)
        else 
            stock = Stock.find_by_ticker(params[:stock_ticker])
            if stock 
                @position = Position.new(user: current_user, stock: stock)
            else 
                stock = Stock.new_from_lookup(params[:stock_ticker])
                if stock.save 
                    @position = Position.new(user: current_user, stock: stock)
                    redirect_to user_portfolio_path 
                else 
                    @position = nil 
                    flash[:error] = "Invalid Stock"
                end 
            end 
        end 

    


    
    private 
    
    def position_params
        params.require(:position).permit(:user_id, :stock_id)
    end

end 

end 