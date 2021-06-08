# frozen_string_literal: true

module Authenticatable
  extend ActiveSupport::Concern

  included do
    prepend_before_action :authenticate!
  end

  private

  def authenticate!
    api_key = params[:api_key]

    unless valid?(api_key)
      render_unauthorized
    end
  end

  def valid?(api_key)
    return false if api_key.blank?

    ProjectCredentials.exists?(api_key: api_key)
  end
end
