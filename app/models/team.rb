class Team < ActiveRecord::Base
  has_many :players

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
		player = Player.generate(position: position)
		aux_players << player
		self.players << player
      end
    end
    players.select { |p| p.position == :goalkeeper }.sample(1).each(&:set_starting!)
    players.select { |p| p.position == :defender }.sample(4).each(&:set_starting!)
    players.select { |p| p.position == :midfielder }.sample(4).each(&:set_starting!)
    players.select { |p| p.position == :striker }.sample(2).each(&:set_starting!)
  end
  
  def starting_players_number
	if players.select{ |player| player.starting }.size != 11
      errors.add(:starting_players_number, "the number of players is different than 11")
    end
  end
end
