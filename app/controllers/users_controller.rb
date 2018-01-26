class UsersController < ApplicationController
    def index
        @user = current_user
    end
    def show 
        @user = User.find_by(id: params[:id])
        @position = @user.stocks 
    end 
    
    def portfolio 
        @position = current_user.stocks 
        @user = current_user
    
    end
end