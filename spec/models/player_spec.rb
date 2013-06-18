require 'spec_helper'

describe Player do
  describe "class methods" do
    describe :generate! do
      describe "without attributes" do
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

      describe "with attributes" do
        before do
          @player = Player.generate!(position: :striker)
        end

        it "should have created a player" do
          @player.should_not be_nil
        end

        it "should have saved the record in the DB" do
          @player.new_record?.should_not be_true
        end

        it "should have set the attribute correctly" do
          @player.position.should == :striker
        end
      end
    end
  end
end
