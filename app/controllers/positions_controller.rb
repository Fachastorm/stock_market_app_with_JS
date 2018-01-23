class UserStocksController < ApplicationController
    
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

    
end