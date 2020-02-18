class Position < ApplicationRecord
  belongs_to :position_name
  belongs_to :user
  belongs_to :team
end
