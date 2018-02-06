class Amount < ApplicationRecord 
    belongs_to :watchlist

    def total #Add the total amount of stock shares that have been bought on the site and route them. 
        @most_added = Amount.group(:watchlist_id).select('SUM(quantity) as qty').order('qty desc')
    end 

end