class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def new 
        @user = User.new 
    end 

    def portfolio
		@positions = current_user.stocks
		@user = current_user
	end

    
end