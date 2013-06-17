require 'spec_helper'

describe Player do
  describe "class methods" do
    describe :generate! do
      before do
        @player = Player.generate!
      end

      it "should have created a player" do
        @player.should_not be_nil
      end

      it "should have saved the record in the DB" do
        @player.new_record?.should_not be_true
      end
    end
  end
end
