require 'spec_helper'

describe "Visitor reads information of a team" do
  before do
    @team = FactoryGirl.create :team
  end

  it "should show the name of the team" do
    visit team_path(@team)
    page.should have_content @team.name
  end

  it "should show the name of the players" do
    visit team_path(@team)
    @team.players.each do |player|
      page.should have_content player.name
    end
  end
end
