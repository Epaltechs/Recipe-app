class PublicRecipesController < ApplicationController
  def index
    @public_recipe = Recipe.order('created_at DESC').where('public = ?', 'Yes')
  end

  def show
    @public_recipe = Recipe.order('created_at DESC').where('public = ?', 'Yes').find(params[:id])
  end
end
