class PositionsController < ApplicationController
    before_action :authenticate_user!

    def index
       @positions = Position.all
    end

    def new 
        @position = Position.new
    end

    def create  
        if params[:stock_id].present?
        @position = Position.new(stock_id: params[:stock_id], user: current_user)
      else
        stock = Stock.find_by_ticker(params[:stock_ticker])
        if stock
          @position = Position.new(user: current_user, stock: stock)
        else
          stock = Stock.new_from_lookup(params[:stock_ticker])
          if stock.save
            @position = Position.new(user: current_user, stock: stock)
          else
            @position = nil
            flash[:error] = "Stock is not available"
          end
        end
      end
        if  @position.save 
            redirect_to portfolio_path, notice: "Stock was successfully added" 
        else 
            render :index
        
        end
    end

        def destroy
            @position = Position.find_by(params[:id])
            @position.destroy 
            redirect_to portfolio_path, notice: "Stock #{@position.stock.ticker} was successfully removed from portfolio."
        end


    
    private 
    
    def position_params
        params.permit(:user_id, :stock_id)
    end


end