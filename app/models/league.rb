class League < ActiveRecord::Base
  STATES = %i(open finished active)

  has_many :teams, through: :league_positions
  has_many :league_positions
  has_many :rounds ##
  
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
    ## per què aqui no hi va un "save"?
  end
  
  def set_league_rounds ##
  @starting_date = ..
    18.times do
      round = round.create(:date => @starting_date + 7)
    end
  end
  
  def find_combinations
    b = teams.combination(2).to_a    
  end
  
end
