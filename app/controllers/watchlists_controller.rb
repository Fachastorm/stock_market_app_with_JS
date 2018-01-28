class WatchlistsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
        def index
            @user = current_user 
            @watchlists = Watchlist.all 
        end 
        
        def new 
            @user = current_user
            @watchlist = Watchlist.new 
        end

        def show 
        end 

        
        def create 
            @watchlist = Watchlist.create(watchlist_params)
            redirect_to user_watchlist_path(@watchlist)
        end 



        private 
        
        def watchlist_params 
            params.require(:watchlist).permit(:name, :description)
        end
    end
