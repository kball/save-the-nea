class CongressionalDistrict < ApplicationRecord
  belongs_to :state
  has_many :grants, -> { order('year desc') }
end
