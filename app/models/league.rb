class League < ActiveRecord::Base
  has_many :leaguePositions, :as => :taggable
  has_many :matches
  
end
