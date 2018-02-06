class Amount < ApplicationRecord 
    belongs_to :watchlist

    def total #Add the total amount of stock shares that have been bought on the site and route them.
         @value = Amount.group(:stock_name).sum(:quantity).to_a
         @value[1..5]
    end
end