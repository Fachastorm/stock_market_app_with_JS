class PositionsController < ApplicationController
    before_action :authenticate_user!

    before_action :set_position, only: [:show, :edit, :update, :destroy]

    def index
        @user = User.find_by(params[:id])
        @positions = @user.positions
    end

    def create
        if params[:stock_id].present?
          @position = Position.new(stock_id: params[:stock_id])
        else
          stock = Stock.find_by_ticker(params[:stock_ticker])
          if stock
            @position = Position.new(stock: stock)
          else
            stock = Stock.new_from_lookup(params[:stock_ticker])
            if stock.save
              @position = User.find_by(params[:id]).stocks             
            else
              @position = nil
              flash[:error] = "Stock is not available"
            end
        end
        end
        if  @position = User.find_by(params[:id]).stocks
            redirect_to user_positions_path(current_user), notice: "Stock was successfully added" 
        else 
            render :index
        
        end
    end

        def destroy
            @position.destroy 
            redirect_to user_positions_path, notice: "Stock #{@position.stock.ticker} was successfully removed from portfolio."
        end


    
    private 
    
    def position_params
        params.require(:position).permit(:user_id, :stock_id)
    end

    def set_position
        @position = Position.find(params[:id])
    end


end