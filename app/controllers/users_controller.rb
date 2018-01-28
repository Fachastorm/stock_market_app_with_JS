class UsersController < ApplicationController
    before_action :authenticate_user!
    def new 
        @user = User.new 
    end 

    def show 
        @user = User.find_by(id: params[:id])
        @position = @user.stocks.name 
    end 
    
end