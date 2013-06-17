class Player < ActiveRecord::Base
  POSITIONS = %i(goalkeeper defender midfielder striker)
  QUALITY_RANGE = 1..999

  belongs_to :team

  validates_presence_of :name, :surname, :position, 
    :quality, :team_id
  validates_inclusion_of :position, in: POSITIONS
  validates_inclusion_of :quality, in: QUALITY_RANGE
end
