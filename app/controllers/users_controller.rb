class UsersController < ApplicationController
    
    def show 
        @user = User.find_by(id: params[:id])
        @user_stocks = @user.stocks 
    end 
    
    def portfolio 
        @user = current_user
        @user_stocks = @user.stocks 
    end 
    
end