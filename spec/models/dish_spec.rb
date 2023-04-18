require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredient_dishes)}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  describe "instance methods" do
    describe "#calories" do
      it "returns the calories for a dish" do
        test_data
        expect(@dish_1.calories).to eq(320)
        expect(@dish_2.calories).to eq(870)
      end
    end
    describe "#chef_name" do
      it "returns the name of the chef the dish belongs to" do
        test_data
        expect(@dish_1.chef_name).to eq(@chef_1.name)
        expect(@dish_3.chef_name).to eq(@chef_2.name)
      end
    end
  end
end