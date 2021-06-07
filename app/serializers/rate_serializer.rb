# frozen_string_literal: true

class RateSerializer
  attr_reader :rate

  def initialize(rate:)
    @rate = rate
  end

  def call
    return {} if rate.blank?

    {
      rate.name.to_sym => rate_value
    }
  end

  private

  def rate_value
    rate_value = LatestRateValueQuery.new(rate: rate).call

    RateValueSerializer.new(rate_value: rate_value).call
  end
end
