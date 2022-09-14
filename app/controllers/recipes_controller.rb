class RecipesController < ApplicationController

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
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to user_recipes_path(current_user.id)
      flash[:notice] = 'Recipe creates successfully'
    else
      flash[:alert] = 'The recipe wasn\'t created'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:notice] = 'The recipe was removed successfully!'
    else
      flash[:alert] = 'The recipe wasn\'t removed.'
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :pubic)
  end
end