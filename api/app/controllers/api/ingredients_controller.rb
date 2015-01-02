class Api::IngredientsController < Api::ApplicationController
  before_filter :require_user, except: [:show, :index]

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
    render json: @ingredients, status: :ok
  end

  def create
    @recipe = @current_user.recipes.find(params[:recipe_id])

    if @recipe.ingredients.create(ingredient_params)
        render json: {message: 'Ingredient added!'}, status: :created
    else
        render json: {errors: @recipe.ingredients.errors.full_messages},
               status: :bad_request
    end
  end

  def destroy
    @recipe = @current_user.recipes.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    if @ingredient.destroy
      render json: {message: 'Ingredient deleted!'}, status: :ok
    else
      render json: {errors: @ingredient.errors.full_messages},
                    status: :bad_request
    end
  end

  def update
    @recipe = @current_user.recipes.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    if @ingredient.update(ingredient_params)
      render json: {message: 'Ingredient updated!'}, status: :ok
    else
      render json: {errors: @ingredient.errors.full_messages},
      status: :bad_request
    end
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :description, :amount, :unit)
    end
end
