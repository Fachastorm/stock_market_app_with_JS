class Amount < ApplicationRecord 
    belongs_to :watchlist

    def total #Add the total amount of stock shares that have been bought on the site and route them. 
        self.sum(:quantity)
    end 

end