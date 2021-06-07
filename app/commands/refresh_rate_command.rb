# frozen_string_literal: true

class RefreshRateCommand
  attr_reader :rate
  attr_reader :value

  def initialize(rate:, value:)
    @rate = rate
    @value = value
  end

  def call
    rate_value_model = RateValue.create!(rate_id: rate.id, value: value)

    RateValueMapper.to_domain(rate_value_model)
  end
end
