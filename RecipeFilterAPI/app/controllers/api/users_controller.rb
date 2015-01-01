class Api::UsersController < Api::ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {message: 'Account created!'}, status: :created
    else
      render json: {errors: @user.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:login, :password, :name, :age)
    end
end
