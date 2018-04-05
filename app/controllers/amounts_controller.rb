class AmountsController < ApplicationController

    def most_added 
        @amounts = Amount.all 
    end 

end 