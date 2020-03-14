  class Team < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :positions
  has_many :rooms

  has_many :pending_applications, through: :positions

  has_one_attached :photo

  def captain?(current_user)
    current_user == user
  end
end
