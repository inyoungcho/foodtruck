class SlotSerializer < ActiveModel::Serializer
  attributes :id, :weekday, :period, :neighborhood, :address, :truck_id
end
