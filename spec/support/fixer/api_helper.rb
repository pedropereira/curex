# frozen_string_literal: true

module Fixer::ApiHelper
  def stub_latest_request(status:, response_body:)
    stub_request(
      :get, %r{http://data.fixer.io/api/latest}
    ).to_return(status: status, body: response_body)
  end
end
