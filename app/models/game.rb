class Game < ApplicationRecord
  has_many :teams
  has_many :position_names
end
