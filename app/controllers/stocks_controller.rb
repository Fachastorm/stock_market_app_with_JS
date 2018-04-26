class StocksController < ApplicationController
    before_action :authenticate_user!
    respond_to :js, :html


    def search
        @user = current_user
        if params[:stock]
            @stock = Stock.find_by_ticker(params[:stock])
            @stock ||= Stock.new_from_lookup(params[:stock])
            if @stock 
            render json: @stock
            
            
        end 
end


end

end 