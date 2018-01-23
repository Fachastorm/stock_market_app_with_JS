class Position < ApplicationRecord
    belongs_to :users
    belongs_to :stock
    
end