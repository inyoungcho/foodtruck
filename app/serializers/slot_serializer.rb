class SlotSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :weekday, :period, :neighborhood, :address

  has_one :truck
end
