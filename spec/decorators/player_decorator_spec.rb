require 'spec_helper'

describe PlayerDecorator do
  subject { FactoryGirl.create(:player).decorate }

  describe :methods do
    describe :fullname do
      it "should return the correctly formatted fullname" do
        subject.fullname.should == "#{subject.name} #{subject.surname}"
      end
    end
  end
end
