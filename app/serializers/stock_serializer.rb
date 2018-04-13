class StockSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :name 
end
