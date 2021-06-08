# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found
    render(json: { errors: { message: "Not found" } }, status: :not_found)
  end

  def render_unauthorized
    render(json: { errors: { message: "Unauthorized" } }, status: :unauthorized)
  end
end
