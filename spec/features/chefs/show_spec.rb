require 'rails_helper'

RSpec.describe "Chef show page" do
  before(:each) do
    test_data
  end

  describe "As a visitor, when I visit a chef's show page" do
    it "has a link to view all ingredients the chef uses in all dishes" do
      visit "/chefs/#{@chef_1.id}"
      expect(page).to have_link("What ingredients am I using?")
    end
    it "links to the chef's ingredients index page" do
      visit "/chefs/#{@chef_1.id}"
      click_link("What ingredients am I using?")
      expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
    end
  end
end