# frozen_string_literal: true

class Fixer::RefreshRate
  attr_reader :rate

  def initialize(rate:)
    @rate = rate
  end

  def call
    response = endpoint.call(**request_params)
    return if response.blank?

    value = value_from(response)
    RefreshRateCommand.new(rate: rate, value: value).call
  end

  private

  def endpoint
    Fixer::Latest.new
  end

  def request_params
    { symbols: rate.symbols.join(",") }
  end

  def value_from(response)
    response["rates"].fetch(rate.to)
  end
end
