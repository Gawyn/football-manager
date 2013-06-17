require 'spec_helper'

describe Player do
  subject { FactoryGirl.build :player }

  describe :hooks do
    describe :set_all! do
      before do
        subject.quality = nil
        subject.position = nil
        subject.valid?
      end

      it "should set a random quality" do
        subject.quality.should_not be_nil
      end

      it "should set a random position" do
        subject.position.should_not be_nil
      end
    end
  end
end
