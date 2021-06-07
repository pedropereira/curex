# frozen_string_literal: true

class LatestRateValueQuery
  attr_reader :rate

  def initialize(rate:)
    @rate = rate
  end

  def call
    rate_value_model = RateValue.where(rate_id: rate.id).order(created_at: :desc).first
    return if rate_value_model.blank?

    RateValueMapper.to_domain(rate_value_model)
  end
end
