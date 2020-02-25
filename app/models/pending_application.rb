class PendingApplication < ApplicationRecord
  belongs_to :user
  belongs_to :position
  has_many :teams, through: :positions
end
