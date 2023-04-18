require 'rails_helper'

RSpec.describe "Dish show page" do
  before(:each) do
    test_data
  end
  describe "As a visitor, when I visit a dish's show page"
    it "shows me the name and description" do
      visit dish_path(@dish_1)
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_no_content(@dish_2.description)
      expect(page).to have_no_content(@dish_2.description)
    end
    it "displays a list of ingredients" do
      visit dish_path(@dish_1)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_no_content(@ingredient_3.name)
      expect(page).to have_no_content(@ingredient_4.name)
    end
    it "displays the total calorie count" do
      visit dish_path(@dish_1)
      expect(page).to have_content("Total Calories: 320")

    end
    it "shows the chef's name" do
      visit dish_path(@dish_3)
      expect(page).to have_content("Chef: #{@chef_2.name}")
      expect(page).to have_no_content(@chef_1.name)
    end
    it "has a form to add an existing ingredient to that dish" do
      visit dish_path(@dish_1)
      expect(page).to have_content("Add Ingredients by ID")
        fill_in :ingredient_id, with: "#{@ingredient_4.id}"
        expect(page).to have_selector(:link_or_button, 'Add')
        click_button "Add"
    end
    it "redirects me to the dish show page after submitting the form" do
      visit dish_path(@dish_1)
      fill_in :ingredient_id, with: "#{@ingredient_4.id}"
      click_button "Add"
      
      expect(current_path).to eq(dish_path(@dish_1))
    end
    it "displays the new ingredient after submitting the form" do
      visit dish_path(@dish_1)
      expect(page).to have_no_content(@ingredient_4.name)
      fill_in :ingredient_id, with: "#{@ingredient_4.id}"
      click_button "Add"

      expect(page).to have_content(@ingredient_4.name)
    end
  end
  