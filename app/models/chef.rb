class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredient_dishes, through: :dishes
  has_many :ingredients, through: :ingredient_dishes

  def unique_ingredients
    ingredients.distinct
  end

  def top_three_ingredients
    ingredients.joins(:ingredient_dishes)
              .group(:id)
              .select("ingredients.*, COUNT(ingredient_dishes.ingredient_id) AS dish_count")
              .order("dish_count desc")
              .limit(3)
  end

end