class TruckSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :kind, :description, :twitter, :facebook, :website, :accepts_cards

  has_many :slots
end
