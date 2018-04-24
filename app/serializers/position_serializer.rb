class PositionSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :stock
end
