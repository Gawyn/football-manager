require 'spec_helper'

describe User do
  describe :attributes do
    it { should respond_to :name }
    it { should respond_to :email }
    it { should respond_to :avatar }
  end
end
