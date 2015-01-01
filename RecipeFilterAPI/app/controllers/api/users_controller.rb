class Api:UsersController < Api::ApplicationController
  before_filter :require_user

  respond_to :json

  def index
    respond_with current_user
  end

  def create

  end

  private
    def user_params
      
    end
end
