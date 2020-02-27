class Team < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :positions

  def captain?(current_user)
    current_user == user
  end
end
