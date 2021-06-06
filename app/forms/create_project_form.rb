# frozen_string_literal: true

class CreateProjectForm
  attr_reader :contract
  attr_reader :params
  attr_reader :result

  def initialize(contract:, params:)
    @contract = contract
    @errors = nil
    @params = params
    @result = nil
  end

  def call
    validation = contract.call(params)

    if validation.success?
      valid_params = validation.to_h

      create_project(valid_params)
    else
      @errors = validation.errors.to_h
    end

    self
  end

  def errors
    @errors.to_h
  end

  def success?
    result.present?
  end

  private

  def create_project(valid_params)
    @result = CreateProjectCommand.new(**valid_params).call
  end
end
