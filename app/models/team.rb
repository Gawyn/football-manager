class Team < ActiveRecord::Base
  has_many :players

  validates_presence_of :name
  validates_uniqueness_of :name
  validate :starting_players_number  

  after_create :create_roster!

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
    [[:goalkeeper,2], [:defender, 8], [:midfielder, 8], 
      [:striker, 4]].each do |position, number| 
      number.times do
        players << Player.generate!(position: position)
      end
    end
  end
  
  def starting_players_number
    if players.where(:starting => true).count != 11
      errors.add(:starting_players_number, "the number of players is different than 11")
    end
  end
end
