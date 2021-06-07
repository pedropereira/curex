# frozen_string_literal: true

class FindRateQuery
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def call
    model = Rate.find_by!(name: name)

    RateMapper.to_domain(model)
  end
end
