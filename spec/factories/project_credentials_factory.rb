# frozen_string_literal: true

FactoryBot.define do
  factory :project_credentials do
    api_key { "1085e2c54f5c1c60fe3531890decc9dffd4fe3b2601ec237d69a509ab96d3249" }
    project_id { create(:project).id }
  end
end
