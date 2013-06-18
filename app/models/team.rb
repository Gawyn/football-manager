class Team < ActiveRecord::Base
  has_many :players

  validates_presence_of :name
  validates_uniqueness_of :name

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
    [[:goalkeeper,1], [:defender, 4], [:midfielder, 4], 
      [:striker, 2]].each do |position, number| 
      number.times do
        players << Player.generate!(position: position)
      end
    end
  end
end
