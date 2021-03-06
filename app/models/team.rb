class Team < ActiveRecord::Base
  belongs_to :user
  has_many :players
  has_many :league_positions 
  has_many :leagues, through: :league_positions
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validate :starting_players_number  

  before_validation :create_roster!, on: :create

  def attacking_quality
    (players.strikers.pluck(:quality) * 6 +
    players.midfielders.pluck(:quality) * 2
    players.defenders.pluck(:quality)).sum
  end

  def defending_quality
    (players.midfielders.pluck(:quality) * 2
    players.defenders.pluck(:quality) * 4).sum
  end

  private

  def create_roster!
    aux_players = []
    [[:goalkeeper,2], [:defender, 8], [:midfielder, 8], 
    [:striker, 4]].each do |position, number| 
      number.times do
        self.players << Player.generate(position: position)
      end
    end

    select_best_players!
  end
  
  def select_best_players!
    [[:goalkeeper,1], [:defender, 4], [:midfielder, 4], 
    [:striker, 2]].each do |position, number|
      players.select { |p| p.position == position }.sort_by{|p| -p.quality}.take(number).each(&:set_starting!)
    end
  end
  
  def starting_players_number
    if new_record?
      if players.select{ |player| player.starting }.size != 11
        errors.add(:starting_players_number, "the number of players is different than 11")
      end
    else
      if players.starting.count != 11
        errors.add(:starting_players_number, "the number of players is different than 11")
      end
    end
  end
end
