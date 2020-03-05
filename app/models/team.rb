  class Team < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :positions

  has_many :pending_applications, through: :positions

  def captain?(current_user)
    current_user == user
  end
end
