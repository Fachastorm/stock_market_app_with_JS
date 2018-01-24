class PortfoliosController < ApplicationController

    def show 
        @user = User.find_by(id params[:id])
        @portfolio = @user.stocks
    end
    
    
    
end 
