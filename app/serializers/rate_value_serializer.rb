# frozen_string_literal: true

class RateValueSerializer
  attr_reader :rate_value

  def initialize(rate_value:)
    @rate_value = rate_value
  end

  def call
    return {} if rate_value.blank?

    {
      value: rate_value.value,
      updated_at: rate_value.updated_at.iso8601
    }
  end
end
