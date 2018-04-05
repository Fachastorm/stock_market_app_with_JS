class WatchlistsController < ApplicationController
        before_action :authenticate_user!
        before_action :set_user, only: [:index]

        def index
            @watchlists = current_user.watchlists 
        end 
        
        def new
            @watchlist = Watchlist.new
            @watchlist.amounts.build 
        end

        def show
            @watchlists = Watchlist.all
        end 

        
        def create
            @watchlist = current_user.watchlists.build(watchlist_params)
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
            params.require(:watchlist).permit(:name, :description, amounts_attributes: [:stock_name, :quantity])
        end

        def set_user 
            @watchlist = current_user.watchlists 
        end
    end
