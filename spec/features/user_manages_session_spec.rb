require 'spec_helper'

describe "User registers through facebook" do
  it "should create and login the user" do
    visit root_path
    click_link "Login"
    page.should have_content "Logout"
  end
end

describe "User registers and creates a team" do
  it "should create a team" do
    visit root_path
    click_link "Login"
    fill_in :team_name, with: "Mock Team FC"
    click_button "Save changes"
    page.should have_content "Mock Team FC"
  end
end

describe "User logins" do
  before do
    FactoryGirl.create :user
  end

  it "should login the user" do
    visit root_path
    click_link "Login"
    page.should have_content "Logout"
  end
end
