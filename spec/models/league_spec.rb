require 'spec_helper'

describe League do
  describe :associations do
    it { should respond_to :league_positions }
    it { should respond_to :teams }
  end
  
  describe :hooks do
    before do
      10.times do
        @team = FactoryGirl.create :team
      end
    end

    it "should balbalba" do
      @league = @team.leagues.first
      p @league.find_combinations
    end
    
    it "should not be open" do
      @team.leagues.first.state.should == "active"
    end
    
    it "should generate a new league after creating 11 teams" do      
      expect { FactoryGirl.create :team }.to change { League.count }.by(1)
    end
  end
end
