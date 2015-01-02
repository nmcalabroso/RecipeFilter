class Api::StepsController < Api::ApplicationController
  before_filter :require_user, except: [:show, :index]

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @steps = @recipe.steps
    render json: @steps, status: :ok
  end

  def create
    @recipe = @current_user.recipes.find(params[:recipe_id])

    if @recipe.steps.create(step_params)
      render json: {message: 'Step added!'}, status: :created
    else
      render json: {errors: @recipe.steps.errors.full_messages},
                    status: :bad_request
    end
  end

  def destroy
    @recipe = @current_user.recipes.find(params[:recipe_id])
    @step = @recipe.steps.find(params[:id])

    if @step.destroy
      render json: {message: 'Step deleted!'}, status: :ok
    else
      render json: {errors: @step.errors.full_messages},
                    status: :bad_request
    end
  end

  def update
    @recipe = @current_user.recipes.find(params[:recipe_id])
    @step = @recipe.steps.find(params[:id])

    if @step.update(step_params)
      render json: {message: 'Step updated!'}, status: :ok
    else
      render json: {errors: @step.errors.full_messages},
      status: :bad_request
    end
  end

  private
    def step_params
      params.require(:step).permit(:description, :order)
    end
end
