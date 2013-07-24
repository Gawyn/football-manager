require 'spec_helper'

describe Match do
  describe :attributes do
    it { should respond_to :home_team_score }
    it { should respond_to :away_team_score }
    it { should respond_to :pending }
  end

  describe :associations do
    it { should respond_to :home_team }
    it { should respond_to :away_team }
  end

  describe :process! do
    before do
      @match = FactoryGirl.create :match
      @match.process!
    end

    it "should not be pending" do
      @match.pending.should_not be_true
    end

    it "should set a home team score" do
      @match.home_team_score.should_not be_nil
    end

    it "should set an away team score" do
      @match.away_team_score.should_not be_nil
    end
  end
end
