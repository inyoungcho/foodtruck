class ApplicationController < ActionController::Base
  respond_to :json
  protect_from_forgery with: :exception

  # Render just the layout, since we're using EmberJS
  def index
    render 'layouts/application'
  end

end
