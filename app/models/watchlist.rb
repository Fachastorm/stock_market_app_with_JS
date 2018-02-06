class Watchlist < ApplicationRecord 
    belongs_to :user 
    has_many :amounts

    validates :name, presence: true
    validates :description, presence: true



    def amounts_attributes=(amounts_attributes)
        amounts_attributes.each do |i, amount_attributes|
          if self.errors.messages.empty?
            self.amounts.build(amount_attributes)
          end
        end
      end
end 