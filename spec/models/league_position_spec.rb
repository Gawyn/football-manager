require 'spec_helper'

describe LeaguePosition do
  
  describe :attributes do
    it { should respond_to :points }
    it { should respond_to :position }
  end

  describe :associations do
    it { should respond_to :league }
    it { should respond_to :team }
  end
  
end
