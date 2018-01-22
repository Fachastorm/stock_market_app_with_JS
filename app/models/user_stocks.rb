class UserStocks < ApplicationRecord
    belongs_to :users
    belongs_to :stock
    
end