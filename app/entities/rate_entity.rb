# frozen_string_literal: true

class RateEntity
  attr_reader :created_at
  attr_reader :id
  attr_reader :name
  attr_reader :updated_at

  def initialize(created_at:, id:, name:, updated_at:)
    @created_at = created_at
    @id = id
    @name = name
    @updated_at = updated_at
  end

  def from
    symbols.first
  end

  def symbols
    name.split("-")
  end

  def to
    symbols.last
  end

  def ==(other)
    id == other.id &&
      name == other.name &&
      created_at == other.created_at &&
      updated_at == other.updated_at
  end
end
