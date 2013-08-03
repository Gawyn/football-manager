class User < ActiveRecord::Base
  has_one :team

  validates_presence_of :name, :email
  validates_uniqueness_of :email
end
