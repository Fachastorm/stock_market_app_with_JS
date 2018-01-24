class PositionsController < ApplicationController
    
    def index
        @positions = Position.all
    end

    def show 
        @position = Position.find(params[:id])
    end 

    def new
        @position = Position.new 
    end 

    def edit 
        @position = Position.find(params[:id])
    end 

    def create 
            stock = Stock.find_by_ticker(params[:stock_ticker])
            if stock 
                @position = Position.new(user: current_user, stock: stock)
            else 
                stock = Stock.new_from_lookup(params[:stock_ticker])
                if stock.save 
                    @position = Position.new(user: current_user, stock: stock)
                    redirect_to user_positions_path 
                else 
                    @position = nil 
                    flash[:error] = "Invalid Stock"
                end 
            end 
        end 

        def update 
            if @position.update(position_params)
                redirect_to position_path
            else 
                redirect_to edit_position_path
            
            end 
        end


        def destroy
            @position = Position.find(params[:id])
            @position.destroy
        end


    
    private 
    
    def position_params
        params.require(:position).permit(:user_id, :stock_id)
    end


end