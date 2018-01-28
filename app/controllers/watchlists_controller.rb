class WatchlistsController < ApplicationController

        def index
            @watchlist = Watchlist.all 
            @user = current_user 
        
        end 

        def show 
            @watchlist = Watchlist.find_by(id: params[:id])
        end 


end 