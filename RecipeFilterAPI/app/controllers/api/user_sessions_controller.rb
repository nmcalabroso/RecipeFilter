class Api::UserSessionsController < Api::ApplicationController
  before_filter :require_user, only: [:destroy]

  def create
    @user = user[:user]

    if (user[:login].blank? || user[:password].blank?) && user[:remember_token].blank?
      render json: {}, status: :bad_request and return
    end

    if user[:remember_token].present?
      user = User.find_by_single_access_token(user[:remember_token])
      user_session = UserSession.create(user) unless user.blank?
    else
      user_session = UserSession.new(login: user[:login], password: user[:password])
    end

    if user_session && user_session.save
      current_user.reset_single_access_token! unless user[:remember_token].present?

      data = {
        auth_token: current_user.single_access_token,
        user_id: current_user.id
      }

      data[:remember_token] = current_user.single_access_token

      user_session.destroy

      render json: data, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user
      current_user.reset_single_access_token!
      render json: {user_id: current_user.id}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end
end
