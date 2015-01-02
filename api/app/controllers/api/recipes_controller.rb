class Api::RecipesController < Api::ApplicationController
  before_filter :require_user, except: [:show, :index]

  def index
    @recipes = Recipe.order(created_at: :desc).all
    render json: @recipes, include: [:ingredients, :steps], status: :ok
  end

  def batch
    order = params[:order] || :desc
    count = params[:count] || 20
    @recipes = Recipe.order(created_at: order).limit(count)
    render json: @recipes, status: :ok
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe, status: :ok
  end

  def create
    if @current_user.recipes.create(recipe_params)
      render json: {message: 'Recipe created!'}, status: :created
    else
      render json: {errors: @current_user.errors.full_messages},
                    status: :unprocessable_entity
    end
  end

  def update
    @recipe = @current_user.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      render json: {message: 'Recipe updated!'}, status: :ok
    else
      render json: {errors: @recipe.errors.full_messages},
                    status: :bad_request
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @current_user.recipes.destroy(@recipe)
      render json: {message: 'Recipe deleted!'}, status: :ok
    else
      render json: {errors: @current_user.errors.full_messages},
             status: :bad_request
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :description)
    end
end
