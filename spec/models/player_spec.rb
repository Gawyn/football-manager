require 'spec_helper'

describe Player do
  describe "class methods" do
    describe :generate! do
      before do
        Player.generate!
        @player = Player.first
      end

      it "should have created a player" do
        @player.should_not be_nil
      end
    end
  end
end
