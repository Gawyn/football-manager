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
  
  def set_league_rounds
    @starting_date = Date.today
    18.times do
      round = round.create(:date => @starting_date + 7)
    end
  end
  
  def find_combinations
    teams.round_robin.each_with_index do |matches, index|
      round = Round.create(date: Date.today + index.days)

      matches.map do |local, visitor|
        Match.create(home_team_id: local.id, away_team_id: visitor.id, round_id: round.id)
      end
    end
  end
end
