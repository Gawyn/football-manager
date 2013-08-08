class League < ActiveRecord::Base
  STATES = %i(open finished active)

  has_many :teams, through: :league_positions
  has_many :league_positions
  
  validates :state, :inclusion => {:in => STATES}
  before_validation :set_default_state
    
  def check_league_state
    if teams.count < 10
      self.state = :open
    else
      self.state = :active
      save
    end
  end
      
  def set_default_state
    self.state ||= :open
  end
end
