class Player < ActiveRecord::Base
  POSITIONS = %i(goalkeeper defender midfielder striker)

  belongs_to :team

  validates_presence_of :name, :surname, :position, 
    :quality, :team_id
  validates_inclusion_of :position, in: POSITIONS
  validates_inclusion_of :quality, in: 1..999
end
