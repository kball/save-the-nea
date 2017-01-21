class State < ApplicationRecord
  has_many :congressional_districts
  has_many :cities
end
