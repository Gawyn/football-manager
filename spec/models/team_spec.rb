require 'spec_helper'

describe Team do
  describe :attributes do
    it { should respond_to :name }
  end

  describe :associations do
    it { should respond_to :players }
    it { should respond_to :leagues }
    it { should respond_to :league_positions }
    it { should respond_to :user }
  end

  describe :validations do
    it "should not be valid without exactly 11 starting players" do
      @team = FactoryGirl.create :team
      player = @team.players.substitute.first
      player.update_attribute(:starting, true)
      @team.should_not be_valid
    end
  end

  describe :hooks do
    describe :create_roster! do
      before do
        @team = FactoryGirl.create :team
      end

      it "should have created 22 players" do
        @team.players.count.should == 22
      end

      it "should have 11 starting users" do
        @team.players.starting.count.should == 11
      end
    end
  end
end
