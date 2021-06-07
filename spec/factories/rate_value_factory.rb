# frozen_string_literal: true

FactoryBot.define do
  factory :rate_value do
    value { 1.21633 }

    rate_id { create(:rate).id }
  end
end
