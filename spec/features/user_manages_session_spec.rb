require 'spec_helper'

describe "User registers through facebook" do
  it "should create and login the user" do
    visit root_path
    click_link "Login"
    page.should have_content "Logout"
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
