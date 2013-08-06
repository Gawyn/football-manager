class League < ActiveRecord::Base
  STATES = %i(open finished active)

  has_many :teams, through: :league_positions
  has_many :league_positions
  
  def check_league_state
    if self.teams < 10
      self.state = :open
    else
      self.state = :active
    end
end
