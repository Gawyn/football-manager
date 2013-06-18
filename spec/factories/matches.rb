# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    home_team factory: :team
    away_team factory: :team
    pending true

    factory :finished_match do
      home_team_score (1..5).to_a.sample
      away_team_score (1..5).to_a.sample
      pending false
    end
  end
end
