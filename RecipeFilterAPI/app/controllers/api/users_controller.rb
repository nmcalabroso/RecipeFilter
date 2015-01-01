class Api:UsersController < Api::ApplicationController
  respond_to :json

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {}, status: :created
      return
    end

    render json: {}, status: :bad_request
  end

  private
    def user_params
      params.require(:user).permit(:login, :password, :name)
    end
end
