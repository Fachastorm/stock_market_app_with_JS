class UserStock < ApplicationRecord
    belongs_to :users
    belongs_to :stock
    
end