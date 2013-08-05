class League < ActiveRecord::Base
  has_many :teams, through: :league_positions
  has_many :league_positions
end
