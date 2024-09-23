class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  include SessionsHelper

  protected

  def render_err(template)
    render template, status: :unprocessable_entity
  end
end
