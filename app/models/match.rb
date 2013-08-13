class Match < ActiveRecord::Base
  HOME_BONUS = 0.10
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :round ##

  validates_presence_of :home_team, :away_team
  validates_presence_of :home_team_score, :away_team_score, unless: :pending

  def process!
    self.home_team_score = 0
    self.away_team_score = 0
    if pending
      # Home Team attacks
      5.times do
        home_attack = home_team.attacking_quality * (1 + HOME_BONUS)
        away_defense = away_team.defending_quality
        self.home_team_score += 1 if goal?(home_attack, away_defense)
      end

      # Away Team attack
      5.times do
        away_attack = away_team.attacking_quality
        home_defense = home_team.defending_quality * (1 + HOME_BONUS)
        self.away_team_score += 1 if goal?(away_attack, home_defense)
      end
    end

    self.pending = false
    save!
  end

  private

  def goal?(attack, defense)
    rand(attack + defense) <= attack
  end
end
