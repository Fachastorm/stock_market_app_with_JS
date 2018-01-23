class PortfoliosController < ApplicationController

    def show 
        @user = current_user
        @portfolio = @user.stocks
    end
    
    
    
end 
