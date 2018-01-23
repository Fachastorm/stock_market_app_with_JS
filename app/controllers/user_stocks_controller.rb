class UserStocksController < ApplicationController
    
    def index 
        @user_stocks = UserStock.all 
    end
end