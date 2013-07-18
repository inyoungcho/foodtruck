class TruckSerializer < ActiveModel::Serializer
  attributes :id, :name, :kind, :description, :twitter, :facebook, :website, :accepts_cards, :slot_ids
end
