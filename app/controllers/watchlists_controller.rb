class WatchlistsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
        def index
            @user = current_user 
            @watchlists = Watchlist.all 
        end 
        
        def new
            @watchlist = current_user.watchlists.build
        end

        def show 
            @watchlist = Watchlist.find(params[:id])
        end 

        
        def create
            @watchlist = current_user.watchlists.new(watchlist_params)
                if @watchlist.save 
            redirect_to watchlists_path
                else 
                    render :new 
                end
        end 

        def edit 
            @watchlist = Watchlist.find_by(id: params[:id])
        end

        def update 
            if @watchlist.update(watchlist_params)
                redirect_to watchlists_path
            else 
                render :new
            end 
        end


        def destroy
            @watchlist = Watchlist.find(params[:id])
            @watchlist.destroy
            redirect_to watchlists_path, notice: "#{@watchlist.name} was successfully removed from watchlist."
        end


        private 
        
        def watchlist_params 
            params.require(:watchlist).permit(:name, :description)
        end
    end
