class LeaguePosition < ActiveRecord::Base
  belongs_to :league
  belongs_to :team
end
