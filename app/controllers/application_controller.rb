class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery with: :exception

  def allow_static_caching
    expires_in 30.minutes, public: true
  end
end
