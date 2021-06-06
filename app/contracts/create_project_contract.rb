# frozen_string_literal: true

class CreateProjectContract < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
  end

  rule(:name) do
    key.failure("already exists") if key? && already_exists?(value)
  end

  private

  def already_exists?(name)
    Project.exists?(name: name)
  end
end
