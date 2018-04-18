class StockSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :name, :last_price

  has_many :positions
  has_many :users, through: :positions
end
