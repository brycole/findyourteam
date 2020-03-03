class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :applications
  has_many :teams
  has_many :positions
  belongs_to :position_name, optional: true

  belongs_to :game, optional: true
  has_one_attached :photo
end
