require 'rails_helper'

RSpec.describe "Chef ingredients index page" do
  before(:each) do
    test_data
  end

  describe "As a visitor, when I visit a chef's ingredients index page" do
    it "displays a unique list of names of all ingredients that the chef uses" do
      visit "/chefs/#{@chef_1.id}/ingredients"
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
        expect(page).to have_content(@ingredient_4.name)
        expect(page).to have_no_content(@ingredient_5.name)
        expect(page).to have_no_content(@ingredient_6.name)
    end
  end
end