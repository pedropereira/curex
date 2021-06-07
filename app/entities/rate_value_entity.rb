# frozen_string_literal: true

class RateValueEntity
  attr_reader :created_at
  attr_reader :id
  attr_reader :rate_id
  attr_reader :updated_at
  attr_reader :value

  def initialize(created_at:, id:, rate_id:, updated_at:, value:)
    @created_at = created_at
    @id = id
    @rate_id = rate_id
    @updated_at = updated_at
    @value = value
  end

  def ==(other)
    id == other.id &&
      value == other.value &&
      rate_id == other.rate_id &&
      created_at == other.created_at &&
      updated_at == other.updated_at
  end
end
