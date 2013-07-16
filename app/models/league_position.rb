class LeaguePosition < ActiveRecord::Base
  belongs_to :taggable, :polymorphic => true
end
