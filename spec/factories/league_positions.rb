# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :league_position do
	league 
	team 
    point 1
  end
end
