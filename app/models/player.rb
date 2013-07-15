class Player < ActiveRecord::Base
  include PlayerNames

  POSITIONS = %i(goalkeeper defender midfielder striker)
  QUALITY_RANGE = 1..999

  belongs_to :team

  validates_presence_of :name, :surname, :position, 
    :quality
  validates_inclusion_of :position, in: POSITIONS
  validates_inclusion_of :quality, in: QUALITY_RANGE

  POSITIONS.each do |position|
    scope position.to_s.pluralize, -> { where(position: position) }
  end
  
  scope :substitute, -> { where(:starting => false) }

  def set_default
    self.name ||= NAMES.sample
    self.surname ||= SURNAMES.sample
    self.position ||= POSITIONS.sample
    self.quality ||= QUALITY_RANGE.to_a.sample
    self
  end

  class << self
    def generate(*attributes)
      new(*attributes).set_default
    end

    def generate!(*attributes)
      player = generate(*attributes)
      player.save!
      player
    end
  end
end
