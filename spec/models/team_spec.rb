require 'spec_helper'

describe Team do
  describe :attributes do
    it { should respond_to :name }
  end

  describe :associations do
    it { should respond_to :players }
  end

  describe :hooks do
    describe :create_roster! do
      before do
        @team = FactoryGirl.create :team
      end

      it "should have created 11 players" do
        @team.players.count == 11
      end
    end
  end
end
