class Api::ApplicationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  private
  def require_user
    unless current_user
      render(:json => {:message => 'Authentication required.'}, :status => 401)
      return false
    end
  end
end