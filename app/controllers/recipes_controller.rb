class RecipesController < ApplicationController
  load_and_authorize_resource
  # before_action :set_user, only: %i[index show new destroy]
  before_action :authenticate_user!, only: %i[index]

  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to "/users/#{current_user.id}/recipes" # user_recipes_path(current_user.id)
      flash[:notice] = 'Recipe creates successfully'
    else
      render :new
      flash[:alert] = 'The recipe wasn\'t created'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to user_recipes_path
      flash[:notice] = 'The recipe was removed successfully!'
    else
      flash[:alert] = 'The recipe wasn\'t removed.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
