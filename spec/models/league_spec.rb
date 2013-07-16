require 'spec_helper'

describe League do
  describe :attributes do
    it { should respond_to :number }
  end

  describe :associations do
    it { should respond_to :teams }
    it { should respond_to :matches }
  end
  
end
