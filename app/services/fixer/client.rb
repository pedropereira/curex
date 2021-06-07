# frozen_string_literal: true

class Fixer::Client
  ACCESS_KEY = ENV.fetch("FIXER_ACCESS_KEY")
  BASE_URL = ENV.fetch("FIXER_BASE_URL")

  def connection
    Faraday.new(url: BASE_URL)
  end
end
