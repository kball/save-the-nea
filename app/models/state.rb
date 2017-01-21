class State < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged


  has_many :congressional_districts
  has_many :cities
end
