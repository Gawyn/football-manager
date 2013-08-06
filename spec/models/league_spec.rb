require 'spec_helper'

describe League do
  describe :associations do
    it { should respond_to :league_positions }
    it { should respond_to :teams }
  end
  
  context "
end
