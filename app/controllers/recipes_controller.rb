class RecipesController < ApplicationController
  def index
    if current_user
      recipes = Recipe.all
      render json: recipes.as_json(include: :user), status: :ok
    else
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end

  def create
    if current_user
      recipe = current_user.recipes.new(recipe_params)
      if recipe.save
        render json: { recipe: recipe }, status: :created
      else
        render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end
  def recipe_params
    params.require(:recipe).permit(:title, :instructions, :minutes_to_complete)
  end
  
end
