# frozen_string_literal: true

class RateMapper
  def self.to_domain(model)
    RateEntity.new(
      id: model.id,
      name: model.name,
      created_at: model.created_at,
      updated_at: model.updated_at
    )
  end
end
