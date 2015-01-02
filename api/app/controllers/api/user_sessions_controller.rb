class Api::UserSessionsController < Api::ApplicationController
  before_filter :require_user, only: [:destroy]

  def create
    @user = user_session_params

    if (@user[:login].blank? || @user[:password].blank?)
      render json: {}, status: :bad_request and return
    end

    if @user[:remember_token].present?
      user = User.find_by_single_access_token(@user[:remember_token])
      user_session = UserSession.create(user) unless user.blank?
    else
      user_session = UserSession.new(login: @user[:login], password: @user[:password])
    end

    if user_session && user_session.save
      current_user.reset_single_access_token! unless @user[:remember_token].present?

      data = {
        auth_token: current_user.single_access_token,
        user_id: current_user.id
      }

      render json: data, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user
      current_user_session.destroy
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  private
    def user_session_params
      params.require(:user_session).permit(:login, :password, :remember_token)
    end
end
