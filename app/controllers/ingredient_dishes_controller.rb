class IngredientDishesController < ApplicationController
  def create
    IngredientDish.create(ingredient_dishes_params)
    redirect_to "/dishes/#{params[:dish_id]}"
  end

  private
  def ingredient_dishes_params
    params.permit(:ingredient_id, :dish_id)
  end
end
