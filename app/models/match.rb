class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  validates_presence_of :home_team, :away_team
  validates_presence_of :home_team_score, :away_team_score, unless: :pending
end
