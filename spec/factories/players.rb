# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    name "Lionel"
    surname "Messi"
    position Player::POSITIONS.sample
    quality Player::QUALITY_RANGE.to_a.sample
    team

    Player::POSITIONS.each do |player_position|
      factory player_position do
        position player_position
      end
    end
  end
end
