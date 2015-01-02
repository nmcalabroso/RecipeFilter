class Api::IngredientsController < Api::ApplicationController
  before_filter :require_user, except: [:show, :index]

  def index
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
  end

  def update
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :description, :amount, :unit)
    end
end
