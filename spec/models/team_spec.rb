require 'spec_helper'

describe Team do
  describe :hooks do
    describe :create_roster! do
      before do
        @team = FactoryGirl.create :team
      end

      it "should have created 22 players" do
        @team.players.count == 11
      end
    end
  end
end
