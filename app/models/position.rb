class Position < ApplicationRecord
  belongs_to :position_name
  belongs_to :user, optional: true
  belongs_to :team
  has_many :pending_applications, dependent: :destroy
end
