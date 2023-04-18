class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredient_dishes, through: :dishes
  has_many :ingredients, through: :ingredient_dishes

end