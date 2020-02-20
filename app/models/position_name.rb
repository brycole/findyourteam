class PositionName < ApplicationRecord
  belongs_to :game
  has_many :positions
end
