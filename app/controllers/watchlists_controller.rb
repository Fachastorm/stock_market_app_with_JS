class WatchlistsController < ApplicationController
    before_action :authenticate_user!
        def index
            @user = User.find_by(params[:id])
            @watchlists = Watchlist.all 
        end 
        
        def new
            @user = User.find_by(params[:id]) 
            @watchlist = @user.watchlists.build
        end

        def show 
            @watchlist = Watchlist.find(params[:id])
        end 

        
        def create
            @user = User.find_by(params[:id]) 
            @watchlist = @user.watchlists.create(watchlist_params)
                if @watchlist.save 
                 redirect_to user_watchlists_path
                else 
                    render :new 
                end
        end 

        def edit
            @user = User.find_by(params[:id])
            @watchlist = Watchlist.find(params[:id])
        end

        def update
            @watchlist = Watchlist.find_by(id: params[:id])
            if @watchlist.update(watchlist_params)
                redirect_to user_watchlists_path(@watchlist.user)
            else 
                render :edit
            end 
        end


        def destroy
            @watchlist = Watchlist.find(params[:id])
            @watchlist.destroy
            redirect_to user_watchlists_path, notice: "#{@watchlist.name} was successfully removed from watchlist."
        end


        private 
        
        def watchlist_params 
            params.require(:watchlist).permit(:name, :description)
        end
    end
