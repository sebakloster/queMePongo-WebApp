class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    if session[:user_id]
    User.find(session[:user_id])
    else
      nil
    end
  end

    rescue_from ActionController::RoutingError, with: -> { render_404  }
    rescue_from ActionController::UnknownController, with: -> { render_404  }
    rescue_from ActiveRecord::RecordNotFound, with: -> { render_404  }

  def render_404
    respond_to do |format|
      format.html { render template: 'errores/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end


end
