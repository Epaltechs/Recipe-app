class ShoppingListsController < ApplicationController
  def index
    @food = Food.all
    # @recipes = Recipe.where(user_id: current_user.id)
    # @ingredients = RecipeFood.where(recipe_id: @recipes.map(&:id))
    # @foods = Food.where(id: @ingredients.map(&:food_id))
  end

  def total_price
    price = 0
    @food.each do |recipe_food|
      price += Food.find(recipe_food.id).price
    end
    price
  end
  helper_method :total_price
end
