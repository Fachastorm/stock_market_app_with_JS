class Portfolio < ApplicationRecord
   belongs_to :user 
   has_many :stocks, through: :user_stocks


end