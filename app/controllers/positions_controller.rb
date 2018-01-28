class PositionsController < ApplicationController
    before_action :authenticate_user!

    before_action :set_position, only: [:show, :edit, :update, :destroy]

    def index
        @user = User.find_by(id: params[:user_id])
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
        if params[:stock_id].present?
          @position = Position.new(stock_id: params[:stock_id])
        else
          stock = Stock.find_by_ticker(params[:stock_ticker])
          if stock
            @position = Position.new(stock: stock)
          else
            stock = Stock.new_from_lookup(params[:stock_ticker])
            if stock.save
              @position = Position.new(stock: stock)              
            else
              @position = nil
              flash[:error] = "Stock is not available"
            end
        end
        end
        if  @position.user_id = current_user.id
            @position.save
            redirect_to user_positions_path(current_user), notice: "Stock #{@position.stock.ticker} stock was successfully added" 
        else 
            render :new  
        
        end
    end

        def update 
            if @position.update(position_params)
                redirect_to user_positions_path(@user)
            else 
                redirect_to search_path
            
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