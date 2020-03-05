class Rank < ApplicationRecord
  belongs_to :game
  has_many :users
end
