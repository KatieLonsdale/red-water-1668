require 'rails_helper'

RSpec.describe "Dish show page" do
  before(:each) do
    test_data
  end
  describe "As a visitor, when I visit a dish's show page"
    it "shows me the name and description" do
      visit "/dishes/#{@dish_1.id}"
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_no_content(@dish_2.description)
      expect(page).to have_no_content(@dish_2.description)
    end
    it "displays a list of ingredients" do
      visit "/dishes/#{@dish_1.id}"
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_no_content(@ingredient_3.name)
      expect(page).to have_no_content(@ingredient_4.name)
    end
    it "displays the total calorie count" do
      visit "/dishes/#{@dish_1.id}"
      expect(page).to have_content("Total Calories: 320")

    end
    it "shows the chef's name" do
      visit "/dishes/#{@dish_3.id}"
      expect(page).to have_content("Chef: #{@chef_2.name}")
      expect(page).to have_no_content(@chef_1.name)
    end
  end
  