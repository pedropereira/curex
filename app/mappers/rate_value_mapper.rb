# frozen_string_literal: true

class RateValueMapper
  def self.to_domain(model)
    RateValueEntity.new(
      id: model.id,
      rate_id: model.rate_id,
      value: model.value,
      created_at: model.created_at,
      updated_at: model.updated_at
    )
  end
end
