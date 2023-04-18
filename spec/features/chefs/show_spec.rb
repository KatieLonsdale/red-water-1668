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
    it "shows me the three most popular ingredients that the chef uses" do
      visit "/chefs/#{@chef_1.id}"
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_no_content(@ingredient_4.name)
      expect(page).to have_no_content(@ingredient_5.name)
      expect(page).to have_no_content(@ingredient_6.name)
      expect(page).to have_no_content(@ingredient_7.name)

      expect(@ingredient_1.name).to appear_before(@ingredient_2.name)
      expect(@ingredient_2.name).to appear_before(@ingredient_3.name)
    end
  end
end