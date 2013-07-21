class EmberController < ApplicationController
  respond_to :html

  # Render just the layout, since we're using EmberJS
  def index
    render 'layouts/application'
  end

end