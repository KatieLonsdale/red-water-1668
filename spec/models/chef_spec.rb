require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredient_dishes).through(:dishes)}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  describe "instance methods" do
    before(:each) do
      test_data
    end
    describe "#unique_ingredients" do
      it "returns an array of unique ingredients that a chef uses" do
        expected = [@ingredient_1, @ingredient_7, @ingredient_2, @ingredient_3, @ingredient_4]
        results = @chef_1.unique_ingredients.sort_by{|ing| ing.name}
        expect(results).to eq(expected)
      end
    end
    describe "#top_three_ingredients" do
      it "returns an array of top 3 ingredients a chef uses" do
        expect(@chef_1.top_three_ingredients).to eq([@ingredient_1, @ingredient_2, @ingredient_3])
      end
    end
  end
end