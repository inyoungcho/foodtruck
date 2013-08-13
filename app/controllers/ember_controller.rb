class EmberController < ApplicationController
  respond_to :html
  after_filter :allow_static_caching

  # Render just the layout, since we're using EmberJS
  def index
    render 'layouts/application'
  end

end