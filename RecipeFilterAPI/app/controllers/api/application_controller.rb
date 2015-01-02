class Api::ApplicationController < ApplicationController
  skip_before_filter :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render(json: {error: 'Record not found.'},
           status: :bad_request)
  end

  private
  def require_user
    unless current_user
      render(json: {message: 'Authentication required.'},
                    status: :unauthorized)
    end
  end
end
